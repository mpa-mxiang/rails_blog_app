require 'test_helper'

RSpec.feature 'Inicio de Sesión', type: :feature do
  scenario 'Usuario inicia sesión con éxito' do
    # Crear un usuario de ejemplo en la base de datos
    User.create(email: 'usuario@example.com', password: 'password123')
    User.create(email: 'usuario@example.com', password: 'password123')

    # Visitar la página de inicio de sesión
    visit new_user_session_path

    # Llenar el formulario de inicio de sesión
    fill_in 'Email', with: 'usuario@example.com'
    fill_in 'Password', with: 'password123'
    click_button 'Iniciar Sesión'

    # Verificar que se ha iniciado sesión con éxito
    expect(page).to have_content 'Bienvenido, usuario@example.com'
  end
end
