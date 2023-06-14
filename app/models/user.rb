class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  def three_recent_posts
    posts.limit(3)
  end
end

user = User.find(1) # Replace 1 with the actual ID of the user
user.three_recent_posts
