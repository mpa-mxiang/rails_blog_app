require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'comments_counter of post should update' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/123', Bio: 'Teacher', PostCounter: 0)
    post = Post.new(author:, Title: 'Hello', Text: 'This is my first post', LikesCounter: 0, CommentsCounter: 0)
    comment = Comment.new(author:, post:)
    author.save
    post.save
    comment.save
    expect(post.CommentsCounter).to eq(1)
  end
end
