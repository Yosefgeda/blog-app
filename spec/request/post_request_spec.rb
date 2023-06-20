require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET Posts/index' do
    before(:each) do
      @user = User.create(name: 'Test User')
      @post1 = @user.posts.create(title: 'Post 1', text: 'Content 1')
      @post2 = @user.posts.create(title: 'Post 2', text: 'Content 2')

      get "/users/#{@user.id}/posts"
    end

    it 'http_status' do
      expect(response).to have_http_status(:success)
    end

    it 'Text of a page rendered' do
      expect(response.body).to include('Posts by user')
    end

    it 'Response status' do
      expect(response.status).to eq(200)
    end

    it 'Index template render' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET Posts/show' do
    before(:each) do
      @user = User.create(name: 'Test User')
      @post1 = @user.posts.create(title: 'Post 1', text: 'Content 1')
      @post2 = @user.posts.create(title: 'Post 2', text: 'Content 2')

      get "/users/#{@user.id}/posts/#{@post1.id}"
    end

    it 'Show http_status' do
      expect(response).to have_http_status(:success)
    end

    it 'Show page text' do
      expect(response.body).to include('One post of a user')
    end

    it 'Show Response status' do
      expect(response.status).to eq(200)
    end

    it 'show template' do
      expect(response).to render_template('show')
    end
  end
end
