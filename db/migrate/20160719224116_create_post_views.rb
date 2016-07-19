class CreatePostViews < ActiveRecord::Migration
  def change
    create_table :post_views do |t|
      t.integer :user_id
      t.integer :post_id
      t.time :time_on_page

      t.timestamps null: false
    end
  end
end
