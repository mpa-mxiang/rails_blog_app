require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'comments_counter of post should update' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    post = Post.new(author_id:, Title: 'Hello', Text: 'This is my first post')
    comment = Comment.new(author_id:, post_id:)
    author.save
    post.save
    comment.save
    expect(post.comments_counter).to eq(1)
  end
end
