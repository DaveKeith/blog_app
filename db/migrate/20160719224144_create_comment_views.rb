class CreateCommentViews < ActiveRecord::Migration
  def change
    create_table :comment_views do |t|
      t.integer :user_id
      t.integer :comment_id
      t.time :time_on_page

      t.timestamps null: false
    end
  end
end
