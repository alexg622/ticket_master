# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: "mail@mail.com", password: "password")
# User.create(email: "mail2@mail.com", password: "password")

Event.create(title: "eventOne", user_id: User.first.id)
Event.create(title: "eventTwo", user_id: User.last.id)

Ticket.create(user_id: User.first.id, event_id: Event.last.id)
Ticket.create(user_id: User.last.id, event_id: Event.last.id)
Ticket.create(user_id: User.first.id, event_id: Event.first.id)
Ticket.create(user_id: User.last.id, event_id: Event.first.id)
