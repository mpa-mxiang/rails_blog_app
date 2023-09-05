require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) do
    User.create(name: 'benja', photo: 'https://picsum.photos/id/237/200/300', post_counter: 5)
    User.create(name: 'benja2', photo: 'https://picsum.photos/id/237/200/300', post_counter: 5)
    user = User.create(name: 'benja3', photo: 'https://picsum.photos/id/237/200/300', post_counter: 5)
  end

  let!(:post) do
    Post.create(title: 'My First Post', text: 'This is my first post', author: user, comments_counter: 0,
                likes_counter: 0)
  end

  let!(:comment) do
    Comment.create(text: 'This is my first comment', author: user, post:)
  end

  it 'shows the username of all other users' do
    visit users_path

    # Verifica que los nombres de los usuarios se muestren en la página
    expect(page).to have_content('benja')
    expect(page).to have_content('benja2')
    expect(page).to have_content('benja3')
  end

  it 'shows the profile picture for each user' do
    visit users_path

    # Verifica que las imágenes de perfil de los usuarios se muestren en la página
    expect(page).to have_css('.user-image img[src*="https://picsum.photos/id/237/200/300"]')
    expect(page).to have_css('.user-image img[src*="https://picsum.photos/id/237/200/300"]')
    expect(page).to have_css('.user-image img[src*="https://picsum.photos/id/237/200/300"]')
  end

  it 'shows the number of posts each user has written' do
    visit users_path

    # Verifica que el número de posts de los usuarios se muestre en la página
    expect(page).to have_content('Number of posts: 5', count: 2)
    expect(page).to have_content('Number of posts: 1', count: 1)
  end
end
