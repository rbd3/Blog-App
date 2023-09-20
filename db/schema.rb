ActiveRecord::Schema[7.0].define(version: 20_230_919_164_022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  # Define the "comments" table
  create_table 'comments', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'post_id'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  # Define the "likes" table
  create_table 'likes', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  # Define the "posts" table
  create_table 'posts', force: :cascade do |t|
    t.bigint 'author_id'
    t.string 'title'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'comments_counter', default: 0
    t.integer 'likes_counter', default: 0
    t.index ['author_id'], name: 'index_posts_on_author_id'
  end

  # Define the "users" table
  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo_url'
    t.text 'bio'
    t.integer 'posts_counter', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  # Define foreign keys
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'posts', 'users', column: 'author_id'
end
