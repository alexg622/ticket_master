# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: "mail@mail.com", password: "password")
# User.create(email: "mail2@mail.com", password: "password")
User.create(email: "mail@mail.com", password: "password")

Event.create(title: "Avengers", user_id: User.first.id)
Event.create(title: "John Wick", user_id: User.first.id)
Event.create(title: "Jumanji", user_id: User.first.id)
Event.create(title: "Matrix", user_id: User.first.id)
Event.create(title: "Fast & Furios", user_id: User.first.id)
Event.create(title: "Harry Potter", user_id: User.first.id)
Event.create(title: "Matrix Reloaded", user_id: User.first.id)
Event.create(title: "Sigma", user_id: User.first.id)
Event.create(title: "Superman", user_id: User.first.id)
