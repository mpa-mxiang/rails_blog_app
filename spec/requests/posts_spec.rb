require 'rails_helper'

RSpec.describe 'Posts', type: :request do
	let(:user) do
    User.create(
      Name: 'Marc',
      Photo: 'http://www.image.com',
      Bio: 'Developer',
      PostCounter: 5
    )
  end

	let!(:post) do
    Post.create(
      Title: 'Ruby',
      Text: 'Learn ruby',
      author_id: user,
      CommentsCounter: 5,
      LikesCounter: 10
    )
  end

	describe 'GET /index' do
    before do
      get "/users/#{user.id}/posts/"
    end

    it 'renders post template' do
      expect(response).to render_template(:index)
    end

    it 'post response body includes correct placeholder text' do
      expect(response.body).to include('List of all posts')
    end
  end

		describe 'GET /show' do
    before do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'returns success for detail post' do
      expect(response).to have_http_status(200)
    end

    it 'renders post detail template' do
      expect(response).to render_template(:index)
    end
  end
end
