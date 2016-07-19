class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10)
    if current_user
      @index_view = current_user.index_views.create
    end
    render :index, locals: { posts: @posts }
  end

  def new
    render :new
  end

  def create
    @post = current_user.posts.create(title: params["title"],
                           content: params["content"])
    redirect_to :root
  end

  def edit
    @post = Post.find(params["id"])
    render :edit, locals: {post: @post}
  end

  def update
    right_now = DateTime.now
    @post = Post.find(params["id"])
    @post.update(title: params["title"],
                content: params["content"])
    @post.updated_at = right_now
    redirect_to :root
  end

  def show
    @post = Post.find(params["id"])
    if current_user
      @post_view = current_user.post_views.create(post_id: @post.id)
    end
    @comments = @post.comments.page(params[:page]).per(10)
    render :show, locals: { comments: @comments }
  end

  def delete
    @post = Post.find(params["id"])
    @post.comments.each do |comment|
      comment.destroy
    end
    @post.post_votes.each do |vote|
      vote.destroy
    end
    @post.destroy
    redirect_to :root
  end
end
