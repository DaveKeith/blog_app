class RenameVotes < ActiveRecord::Migration
  def change
    rename_table :votes, :comment_votes
  end
end
