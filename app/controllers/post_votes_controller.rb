class PostVotesController < ApplicationController
  def upvote
    @post = Post.find(params["id"])
    @post_vote = @post.post_votes.create(user_id: current_user.id,
                                          upvote: true,
                                          downvote: false)
    redirect_to :root
  end

  def downvote
    @post = Post.find(params["id"])
    @post_vote = @post.post_votes.create(user_id: current_user.id,
                                          upvote: false,
                                          downvote: true)
    redirect_to :root
  end

  def undo
    @post = Post.find(params["id"])
    @post_vote = PostVote.where(user_id: current_user, post_id: @post.id)
    @post_vote[0].destroy
    redirect_to :root
  end
end
