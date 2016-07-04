class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.boolean :upvote
      t.boolean :downvote
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
