require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Title must be present' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must be less than 250 chars' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    subject.Title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus neque quis nulla facilisis consequat. Nulla urna enim, lacinia quis odio at, venenatis tempus ante. In venenatis eros a magna aliquam, vitae placerat lectus lobortis. Donec auctor efficitur justo vitae iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In euismod libero vel lorem vulputate, et auctor metus placerat. Donec quis sapien ipsum. Cras vel massa bibendum, commodo libero vel, pharetra quam. Ut viverra hendrerit commodo. Aliquam dapibus et est id porta. Sed in ligula dui. Quisque at nisl non odio pretium hendrerit et sed nisl. Duis dolor quam, malesuada non eros ac, pellentesque elementum ex. Sed dictum sem arcu, a ornare arcu venenatis in. Nam vehicula mauris ut egestas tincidunt.'
    expect(subject).to_not be_valid
  end

  it 'user likes should not be negative' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    subject.LikesCounter = -1
    expect(subject).to_not be_valid
  end

  it 'nil should be allowed' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    subject.LikesCounter = nil
    expect(subject).to be_valid
  end

  it 'user comments should not be negative' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    subject.CommentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'nil should be allowed' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    subject.CommentsCounter = nil
    expect(subject).to be_valid
  end

  it 'recent comments should return the last 5' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    author.save
    subject.save
    first_comment = Comment.new(post: subject, author:, Text: 'Hi Tom!')
    second_comment = Comment.new(post: subject, author:, Text: 'Hi Tom!')
    third_comment = Comment.new(post: subject, author:, Text: 'Hi Tom!')
    fourth_comment = Comment.new(post: subject, author:, Text: 'Hi Tom!')
    fifth_comment = Comment.new(post: subject, author:, Text: 'Hi Tom!')
    sixth_comment = Comment.new(post: subject, author:, Text: 'Hi Tom!')
    first_comment.save
    second_comment.save
    third_comment.save
    fourth_comment.save
    fifth_comment.save
    sixth_comment.save
    expect(subject.recent_comments).to eq([sixth_comment, fifth_comment, fourth_comment, third_comment, second_comment])
  end

  it 'posts_counter of author should update' do
    author = User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    subject = Post.new(author:, Title: 'Hello', Text: 'This is my first post')
    author.save
    subject.save
    expect(author.PostCounter).to eq(1)
  end
end
