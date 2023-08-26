require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.', PostCounter: 0) }

  before { subject.save }
  it 'name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'user posts should not be negative' do
    subject.PostCounter = -1
    expect(subject).to_not be_valid
  end

  it 'zero (0) should be allowed' do
    subject.PostCounter = 0
    expect(subject).to be_valid
  end

  it 'Postcounter is not a numerical value' do
    subject.PostCounter = 'not_numeric'
    subject.save
    expect(subject).to_not be_an_instance_of(Numeric)
  end

  it 'posts_counter of author should update' do
    post = Post.new(author: subject, Title: 'Hello', Text: 'first post', LikesCounter: 0, CommentsCounter: 0)
    post.save
    subject.save
    expect(subject.PostCounter).to eq(1)
  end

  it 'recent posts should return the last 3' do
    first_post = Post.new(author: subject, Title: 'Hello', Text: 'first post', LikesCounter: 0, CommentsCounter: 0)
    second_post = Post.new(author: subject, Title: 'Hello', Text: 'second post', LikesCounter: 0, CommentsCounter: 0)
    third_post = Post.new(author: subject, Title: 'Hello', Text: 'tirth post', LikesCounter: 0, CommentsCounter: 0)
    fourth_post = Post.new(author: subject, Title: 'Hello', Text: 'fourth post', LikesCounter: 0, CommentsCounter: 0)
    subject.save
    first_post.save
    second_post.save
    third_post.save
    fourth_post.save

    expect(subject.recent_posts).to eq([fourth_post, third_post, second_post])
  end
end
