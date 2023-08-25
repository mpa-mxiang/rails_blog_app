require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'likes_counter of post should update' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    post = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    like = Like.new(author:, post:)
    author.save
    post.save
    like.save
    expect(post.LikesCounter).to eq(1)
  end
end
