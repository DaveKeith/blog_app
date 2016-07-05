class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.page(params[:page]).per(10)
    render :index, locals: { posts: @posts }
  end

  def new
    render :new
  end

  def create
    @post = current_user.posts.create(title: params["title"],
                           content: params["content"],
                           upvotes: 0,
                           downvotes: 0,
                           views: 0)
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
