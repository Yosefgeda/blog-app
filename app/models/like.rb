class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_like_counter

  private

  def update_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
