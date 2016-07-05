class RemoveUpvotesFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :upvotes, :integer
  end
end
