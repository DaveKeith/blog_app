class RemoveDownvotesFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :downvotes, :integer
  end
end
