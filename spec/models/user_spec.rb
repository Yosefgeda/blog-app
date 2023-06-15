require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not save user without name' do
    user = User.new
    expect(user.save).to be_falsy
  end
  it 'should not accept non numeric posts_counter' do
    user = User.new
    user.posts_counter = 'F'
    expect(user).to_not be_valid
  end
  it 'returns three recent posts in descending order' do
    user = User.new(name: 'John Doe', posts_counter: 0)
    user.save
    post1 = user.posts.new(title: 'First Post', likes_counter: 0, comments_counter: 0)
    post2 = user.posts.new(title: 'Second Post', likes_counter: 0, comments_counter: 0)
    post3 = user.posts.new(title: 'Third Post', likes_counter: 0, comments_counter: 0)

    post1.save
    post2.save
    post3.save

    recent_posts = user.three_recent_posts

    expect(recent_posts.map(&:title)).to eq(['Third Post', 'Second Post', 'First Post'])
  end
end
