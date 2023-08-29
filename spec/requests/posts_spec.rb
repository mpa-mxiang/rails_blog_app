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
end
