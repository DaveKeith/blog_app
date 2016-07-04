class CommentsController < ApplicationController
  def create
    @post = Post.find(params["id"])
    @comment = @post.comments.create(body: params["body"],
                                        post_id: @post.id,
                                        user_id: current_user.id,
                                        upvotes: 0,
                                        downvotes: 0)
    @comment_vote = @comment.comment_votes.create(user_id: current_user.id,
                                          upvote: false,
                                          downvote: false)
    redirect_to posts_display_path(params["id"])
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
