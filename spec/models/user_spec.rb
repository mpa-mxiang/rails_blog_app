require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

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

  it 'recent posts should return the last 3' do
    first_post = Post.new(author: subject, Title: 'Hello', Text: 'This is my first post')
    second_post = Post.new(author: subject, Title: 'Hello', Text: 'This is my second post')
    third_post = Post.new(author: subject, Title: 'Hello', Text: 'This is my third post')
    fourth_post = Post.new(author: subject, Title: 'Hello', Text: 'This is my fourth post')
    first_post.save
    second_post.save
    third_post.save
    fourth_post.save

    expect(subject.recent_posts).to eq([fourth_post, third_post, second_post])
  end
end
