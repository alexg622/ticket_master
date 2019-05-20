module Types
  class Types::EventType < Types::BaseObject
    description "An Event"

    field :id, ID, null: false
    field :title, String, null: true
    field :user, UserType, null: false
    field :attending_users, [UserType], null: true
    field :tickets, [TicketType], null: true

    def attending_users
      object.attending_users
    end

  end
end
