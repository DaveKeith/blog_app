class RemoveUpvotesFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :upvotes, :integer
  end
end
