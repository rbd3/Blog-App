require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts/:id' do
    it 'returns http success' do
      get '/users/1/posts/'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get '/users/1/posts/'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/1/posts/'
      expect(response.body).to include('<h1>Hi</h1>')
    end
  end
end
