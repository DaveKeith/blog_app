class CommentsController < ApplicationController
  def create
    @post = Post.find(params["id"])
    @comment = @post.comments.create(body: params["body"],
                                        post_id: @post.id,
                                        user_id: current_user.id)
    redirect_to posts_display_path(params["id"])
  end

  def create2
    @parent_comment = Comment.find(params["id"])
    @comment = Comment.create(body: params["body"],
                              post_id: @parent_comment.post_id,
                              user_id: current_user.id,
                              comment_id: @parent_comment.id)
    redirect_to posts_display_path(params["id"])
  end

  def show
    @parent_comment = Comment.find(params["id"])
    @comments = Comment.where(comment_id: @parent_comment.id)
    # @comments = @parent_comment.comments.page(params[:page]).per(10)
    render :show, locals: { comments: @comments }
  end

  def delete
    @comment = Comment.find(params["id"])
    post_num = @comment.post_id
    @comment.comment_votes.each do |vote|
      vote.destroy
    end
    @comment.destroy
    redirect_to posts_display_path(post_num)
  end
end
