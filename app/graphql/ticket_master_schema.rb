#app/graphql/ticket_master_schema.rb
class TicketMasterSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
