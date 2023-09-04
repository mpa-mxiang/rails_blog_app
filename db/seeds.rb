# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Este archivo seed crea varios usuarios de ejemplo en la base de datos.

# Define el número de usuarios que deseas crear
num_users = 10
puts 'creando usuarios'
# Utiliza un bucle times para crear usuarios con datos aleatorios
num_users.times do |i|
  User.create(
    name: "User #{i + 1}",
    photo: "Photo #{i + 1}",
    bio: "Bio #{i + 1}",
    postCounter: 0    
  )
  puts 'ususario creado exitosamente'
end

# Puedes ajustar el número de usuarios y los datos aleatorios según tus necesidades.



