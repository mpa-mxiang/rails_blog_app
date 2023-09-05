require 'rails_helper'

RSpec.feature 'User Profile', type: :feature do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/id/237/200/300', bio: 'User bio',
                        post_counter: 0)
    @post1 = Post.create(title: 'My First Post', text: 'This is my first post', author: @user, comments_counter: 0,
                         likes_counter: 0)
  end

  scenario "I can see the user's profile picture, username, the number of posts, bio and post" do
    visit user_path(@user)
    expect(page).to have_css('.user-image img[src*="https://picsum.photos/id/237/200/300"]')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('Number of posts: ')
    expect(page).to have_content('User bio')
    expect(page).to have_content('My First Post')
  end

  scenario "I can see a button that lets me view all of a user's posts and use it" do
    visit user_path(@user)
    click_link('See all posts')
    expect(current_path).to eq(user_posts_path(user_id: @user.id))
    expect(page).to have_link('See all posts', href: user_posts_path(user_id: @user.id))
  end
end
