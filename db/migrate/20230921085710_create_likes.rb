class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :post, foreign_key: { to_table: :posts }

      t.timestamps
    end

    # indexing foreign_key column "user_id"
    unless index_exists?(:likes, :user_id)
      add_index :likes, :user_id
    end

    # indexing foreign_key column "post_id"
    unless index_exists?(:likes, :post_id)
      add_index :likes, :post_id
    end

  end
end
