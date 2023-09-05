require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before do
    @user = User.create(name: 'John Doe', photo: 'user.jpg', post_counter: 0)
    @post = Post.create(title: 'My Post', text: 'This is my post', author: @user, comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(author: @user, post: @post, text: 'First comment')
    @comment2 = Comment.create(author: @user, post: @post, text: 'Second comment')
  end

  it "displays the post's title" do
    p @user
    p @post
    visit user_post_path(@user, @post)
    expect(page).to have_content('My Post')
  end

  it 'displays who wrote the post' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('John Doe')
  end

  it 'displays how many comments the post has' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Comments: 2')
  end

  it 'displays how many likes the post has' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the post body' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('This is my post')
  end

  it 'displays the username of each commentor' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('John Doe')
  end

  it 'displays the comment each commentor left' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('First comment')
    expect(page).to have_content('Second comment')
  end
end
