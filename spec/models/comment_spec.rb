require 'rails_helper'

describe Comment, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.', posts_counter: 0) }
  let(:post) do
    Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end
  let!(:comment) { Comment.new(author: user, post:) }

  it 'should increase post comments counter by 1' do
    expect do
      comment.save
    end.to change { post.reload.comments_counter }.from(0).to(1)
  end
end
