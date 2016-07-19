class CreateIndexViews < ActiveRecord::Migration
  def change
    create_table :index_views do |t|
      t.integer :user_id
      t.time :time_on_page

      t.timestamps null: false
    end
  end
end
