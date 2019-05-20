#app/graphql/types/mutation_type
module Types
  class MutationType < Types::BaseObject

    # field :create_user, UserType, null: true, description: "Create a User" do
    #   argument :email, String, required: false
    #   argument :password, String, required: true
    # end
    #
    # def create_user(email:, password:)
    #   User.create(email: email, password: password)
    # end

    #User Mutations
    #import from another file
    field :create_user, Types::UserType, mutation: Mutations::CreateUser

    field :patch_user, UserType, null: true, description: "Update User Attributes" do
      argument :email, String, required: false
      argument :password, String, required: false
      argument :id, ID, required: true
    end

    def patch_user(email: nil, password: nil, id:)
      user = User.find(id)
      email = email.present? ? email : user.email
      password = password.present? ? password : user.password
      if user.update_attributes(email: email, password: password)
        user
      else
        raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
      end
    end

    field :delete_user, UserType, null: true, description: "Delete User" do
      argument :id, ID, required: true
    end

    def delete_user(id:)
      user = User.find(id)
      if user.destroy
        user
      else
        raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
      end
    end

    #Event Mutations
    field :create_event, EventType, null: true, description: "Create Event" do
      argument :title, String, required: true
      argument :user_id, ID, required: true
    end

    def create_event(user_id:, title: nil)
      event = Event.new(title: title, user_id: user_id)
      if event.save
        event
      else
        raise GraphQL::ExecutionError, event.errors.full_messages.join(", ")
      end
    end

    field :patch_event, EventType, null: true, description: "Update Event" do
      argument :id, ID, required: true
      argument :title, String, required: false
    end

    def patch_event(id:, title: nil)
      event = Event.find(id)
      title = title.present? ? title : event.title
      if event.update_attributes(title: title)
        event
      else
        raise GraphQL::ExecutionError, event.errors.full_messages.join(", ")
      end
    end

    field :delete_event, EventType, null: true, description: "Delete Event" do
      argument :id, ID, required: true
    end

    def delete_event(id:)
      event = Event.find(id)
      if event.destroy
      else
        raise GraphQL::ExecutionError, event.errors.full_messages(", ")
      end
    end

    #Create Ticket
    field :create_ticket, TicketType, null: true, description: "Create Ticket" do
      argument :user_id, ID, required: true
      argument :event_id, ID, required: true
    end

    def create_ticket(user_id:, event_id:)
      ticket = Ticket.new(user_id: user_id, event_id: event_id)
      if ticket.save
        ticket
      else
        raise GraphQL::ExecutionError, ticket.errors.full_messages(", ")
      end
    end

    field :delete_ticket, TicketType, null: true, description: "Delete Ticket" do
      argument :id, ID, required: true
    end

    def delete_ticket(id:)
      ticket = Ticket.find(id)
      if ticket.destroy
        ticket
      else
        raise GraphQL::ExecutionError, ticket.errors.full_messages(", ")
      end
    end

  end
end
