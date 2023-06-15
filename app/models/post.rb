class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end
end
