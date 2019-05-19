module Types
  class Types::TicketType < Types::BaseObject
    description "A Ticket"

    field :id, ID, null: false
    field :user_id, ID, null: false
    field :event_id, ID, null: false 
  end
end
