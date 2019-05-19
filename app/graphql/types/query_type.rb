module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator" do
    #   argument :name, String, required: true
    # end
    # def test_field(name:)
    #   Rails.logger.info context.inspect
    #   "Hello #{name}"
    # end


    field :user, Types::UserType, null: true, description: "One User" do
      argument :id, ID, required: true
    end

    field :users, [Types::UserType], null: true, description: "All users"

    def user(id:)
      User.where(id: id).first
    end

    def users
      User.all
    end

    field :event, Types::EventType, null: true, description: "One Event" do
      argument :id, ID, required: true
    end

    field :events, [Types::EventType], null: true, description: "All Events"

    def event(id:)
      Event.where(id: id).first
    end

    def events
      Event.all
    end

  end
end
