# This migration creates the "posts" table.
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users } # Foreign key for user (named author_id)
      t.string :title
      t.text :text
      t.timestamps # This line adds created_at and updated_at columns
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
    end
  end
end
