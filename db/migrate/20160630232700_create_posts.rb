class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.datetime :last_post_update
      t.integer :upvotes
      t.integer :downvotes
      t.integer :views
      t.string :pic_file_name
      t.string :pic_content_type
      t.integer :pic_file_size
      t.datetime :pic_updated_at

      t.timestamps null: false
    end
  end
end
