class RemovePostIdFromCommentVotes < ActiveRecord::Migration
  def change
    remove_column :comment_votes, :post_id, :integer
  end
end
