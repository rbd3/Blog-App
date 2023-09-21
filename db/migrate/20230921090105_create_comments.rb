class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :post, foreign_key: { to_table: :posts }
      t.text :text

      t.timestamps
    end

    # indexing foreign_key column "author_id"
    unless index_exists?(:comments, :author_id)
      add_index :comments, :author_id
    end

    # indexing foreign_key column "author_id"
    unless index_exists?(:comments, :post_id)
      add_index :comments, :post_id
    end
  end
end
