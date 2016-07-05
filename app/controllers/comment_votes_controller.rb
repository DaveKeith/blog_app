class CommentVotesController < ApplicationController
  def upvote
    @comment = Comment.find(params["id"])
    @comment_vote = @comment.comment_votes.create(user_id: current_user.id,
                                                  upvote: true,
                                                  downvote: false)
    redirect_to posts_display_path(@comment.post_id)
  end

  def downvote
    @comment = Comment.find(params["id"])
    @comment_vote = @comment.comment_votes.create(user_id: current_user.id,
                                                  upvote: false,
                                                  downvote: true)
    redirect_to posts_display_path(@comment.post_id)
  end

  def undo
    @comment = Comment.find(params["id"])
    @comment_vote = CommentVote.where(user_id: current_user.id, comment_id: @comment.id)
    @comment_vote[0].destroy
    redirect_to posts_display_path(@comment.post_id)
  end
end
