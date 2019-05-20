#app/graphql/types/user_type
module Types
  class Types::UserType < Types::BaseObject
    description "A User"

    field :id, ID, null: false
    field :email, String, null: true
    field :password, String, null: true
    field :events, [EventType], null: true
    field :upcoming_events, [EventType], null: true

    def upcoming_events
      object.upcoming_events
    end

  end
end
