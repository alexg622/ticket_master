#app/graphql/mutations/create_user
class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  argument :email, String, required: false
  argument :password, String, required: true

  def resolve(email: nil, password: nil)
    user = User.new(email: email, password: password)
    if user.save
      user
    else
      raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
    end
  end

end
