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
      Author_id: user,
      CommentsCounter: 5,
      LikesCounter: 10
    )
  end
end
