# spec/integration/user_post_index_spec.rb

require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  before(:each) do
    
    # Crear un usuario y sus publicaciones en la base de datos
    @user = User.create(name: "John Doe", photo: "https://picsum.photos/id/237/200/300", bio: "User bio", post_counter: 0)
    @post1 =  Post.create(title: 'My First Post', text: 'This is my first post', author: @user, comments_counter: 0,
      likes_counter: 0)
    @post2 =  Post.create(title: 'My second Post', text: 'This is my second post', author: @user, comments_counter: 0,
      likes_counter: 0)
    @post3 =  Post.create(title: 'My third Post', text: 'This is my third post', author: @user, comments_counter: 0,
      likes_counter: 0)
    
    @comment1 = Comment.create(author: @user, post: @post1, text: "some random comment")
    @comment2 = Comment.create(author: @user, post: @post1, text: "some random comment")
    @comment3 = Comment.create(author: @user, post: @post1, text: "some random comment")
    
    
  end

  it 'I can see the user\'s profile picture' do
    visit user_posts_path(@user)
    expect(page).to have_css('.user-image img[src*="https://picsum.photos/id/237/200/300"]')
  end

  it 'I can see the user\'s username' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'I can see the number of posts the user has written' do
    visit user_posts_path(@user)
    expect(page).to have_content("Number of posts: #{@user.posts.count}")
  end

  it 'I can see a post\'s title' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.posts.first.title)
  end

  it 'I can see some of the post\'s body' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.posts.first.text[0..50]) # Muestra los primeros 50 caracteres del texto del post
  end

  it 'I can see the first comments on a post' do
    visit user_posts_path(@user)    
    expect(page).to have_content(@user.posts.first.comments.first.text)    
  end

  it 'I can see how many comments a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content("Comments: #{@user.posts.first.comments.count}")
  end

  it 'I can see how many likes a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content("Likes: #{@user.posts.first.likes_counter}")
  end

  it 'I can see a section for pagination if there are more posts than fit on the view' do    

    10.times do 
      Post.create(title: 'My third Post', text: 'This is my third post', author: @user, comments_counter: 0,
        likes_counter: 0)
    end

    visit user_posts_path(@user)
    expect(page).to have_selector('.pagination')
  end

  it 'When I click on a post, it redirects me to that post\'s show page' do
    visit user_posts_path(@user)
    click_link @user.posts.first.title
    expect(page).to have_current_path(user_post_path(@user, @user.posts.first))
  end
end
