class PostVotesController < ApplicationController
  def upvote
    @post = Post.find(params["id"])
    votes = PostVote.where(:user_id => current_user.id, :post_id => @post.id)
    @post.update(upvotes: @post.upvotes + 1)
    votes[0].update(upvote: true)
    redirect_to :root
  end

  def downvote
    @post = Post.find(params["id"])
    votes = PostVote.where(:user_id => current_user.id, :post_id => @post.id)
    @post.update(downvotes: @post.downvotes + 1)
    votes[0].update(downvote: true)
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
