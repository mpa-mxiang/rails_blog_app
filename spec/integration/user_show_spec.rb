require 'rails_helper'

RSpec.feature 'User Profile', type: :feature do
  before(:each) do
    # Crear un usuario y sus publicaciones en la base de datos
    @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/id/237/200/300', bio: 'User bio',
                        post_counter: 0)
    @post1 = Post.create(title: 'My First Post', text: 'This is my first post', author: @user, comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(title: 'My second Post', text: 'This is my second post', author: @user, comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(title: 'My third Post', text: 'This is my third post', author: @user, comments_counter: 0,
                         likes_counter: 0)
  end

  scenario "I can see the user's profile picture" do
    visit user_path(@user)
    expect(page).to have_css('.user-image img[src*="https://picsum.photos/id/237/200/300"]')
  end

  scenario "I can see the user's username" do
    visit user_path(@user)
    expect(page).to have_content('John Doe')
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_path(@user)
    expect(page).to have_content('Number of posts: ')
  end

  scenario "I can see the user's bio" do
    visit user_path(@user)
    expect(page).to have_content('User bio')
  end

  scenario "I can see the user's first 3 posts" do
    visit user_path(@user)
    expect(page).to have_content('My First Post')
    expect(page).to have_content('My second Post')
    expect(page).to have_content('My third Post')
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    visit user_path(@user)
    expect(page).to have_link('See all posts', href: user_posts_path(user_id: @user.id))
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    visit user_path(@user)
    click_link('My First Post')
    expect(current_path).to eq(posts_path(@post1))
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    visit user_path(@user)
    click_link('See all posts')
    expect(current_path).to eq(user_posts_path(user_id: @user.id))
  end
end
