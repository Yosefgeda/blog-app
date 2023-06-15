class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'

  def three_recent_posts
    posts.order('created_at Desc').limit(3)
  end
end

user = User.find(1) # Replace 1 with the actual ID of the user
user.three_recent_posts
