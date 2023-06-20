require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #index' do
    render_views
    it 'renders a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get :index
      puts response.body
      expect(response.body).to include('List of all Users')
    end
  end
  describe 'GET #show' do
    let(:user) { User.create(name: 'John', posts_counter: 0) }

    it 'renders a successful response' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the correct user to @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end
end
