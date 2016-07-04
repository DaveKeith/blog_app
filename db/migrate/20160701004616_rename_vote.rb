class RenameVote < ActiveRecord::Migration
  def change
    rename_table :vote, :comment_vote
  end
end
