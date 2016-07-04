class CommentVotesController < ApplicationController
  def upvote
    @comment = Comment.find(params["id"])
    votes = CommentVote.where(:user_id => current_user.id, :comment_id => @comment.id)
    @comment.update(upvotes: @comment.upvotes + 1)
    votes[0].update(upvote: true)
    redirect_to posts_display_path(@comment.post_id)
  end

  def downvote
    @comment = Comment.find(params["id"])
    votes = CommentVote.where(:user_id => current_user.id, :comment_id => @comment.id)
    @comment.update(downvotes: @comment.downvotes + 1)
    votes[0].update(downvote: true)
    redirect_to posts_display_path(@comment.post_id)
  end

  def undo
    @comment = Comment.find(params["id"])
    votes = CommentVote.where(:user_id => current_user.id, :comment_id => @comment.id)
    if votes[0].upvote == true
      @comment.update(upvotes: @comment.upvotes - 1)
    else
      @comment.update(downvotes: @comment.downvotes - 1)
    end
    votes[0].update(upvote: false, downvote: false)
    redirect_to posts_display_path(@comment.post_id)
  end
end
