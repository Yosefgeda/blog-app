require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.', posts_counter: 0) }
  let(:post) do
    Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end
  let(:like) { Like.new(author: user, post:) }

  before { post.save }

  it 'updates the likes_counter on the associated post' do
    expect(post.likes_counter).to eq(0)
    like.save
    expect(post.reload.likes_counter).to eq(1)
  end
end
