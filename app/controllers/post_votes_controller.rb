class PostVotesController < ApplicationController
  def upvote
    @post = Post.find(params["id"])
    votes = PostVote.where(:user_id => current_user.id, :post_id => @post.id)
    if votes[0]
      votes[0].update(upvote: true)
    else
      @post_vote = @post.post_votes.create(user_id: current_user.id,
                                          upvote: true,
                                          downvote: false)
    end
    @post.update(upvotes: @post.upvotes + 1)
    redirect_to :root
  end

  def downvote
    @post = Post.find(params["id"])
    votes = PostVote.where(:user_id => current_user.id, :post_id => @post.id)
    if votes[0]
      votes[0].update(downvote: true)
    else
      @post_vote = @post.post_votes.create(user_id: current_user.id,
                                          upvote: false,
                                          downvote: true)
    end
    @post.update(downvotes: @post.downvotes + 1)
    redirect_to :root
  end

  def undo
    @post = Post.find(params["id"])
    votes = PostVote.where(:user_id => current_user.id, :post_id => @post.id)
    if votes[0].upvote == true
      @post.update(upvotes: @post.upvotes - 1)
    else
      @post.update(downvotes: @post.downvotes - 1)
    end
    votes[0].update(upvote: false, downvote: false)
    redirect_to :root
  end
end
