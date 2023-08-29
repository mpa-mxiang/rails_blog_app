require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    User.create(
      Name: 'Marc',
      Photo: 'http://www.image.com',
      Bio: 'Developer',
      PostsCounter: 5
    )
  end

  before do
    get '/users'
  end

  describe 'User GET/ index ' do
    it 'returns user http success' do
      expect(response).to have_http_status(200)
    end

    it 'renders user template' do
      expect(response).to render_template(:index)
    end

    it 'user responsed body with correct place holder' do
      expect(response.body).to include('All Users')
    end
  end
end
