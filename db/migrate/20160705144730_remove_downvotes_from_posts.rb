class RemoveDownvotesFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :downvotes, :integer
  end
end
