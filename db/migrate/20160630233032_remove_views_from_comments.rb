class RemoveViewsFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :views, :integer
  end
end
