class RemoveLastPostUpdateToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :last_post_update, :datetime
  end
end
