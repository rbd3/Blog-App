class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_like_posts_counter

  def increment_like_posts_counter
    post.update(likes_counter: post.likes.count)
  end
end
