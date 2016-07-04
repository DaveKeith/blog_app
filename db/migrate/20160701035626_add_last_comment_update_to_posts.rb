class AddLastCommentUpdateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :last_comment_update, :datetime
  end
end
