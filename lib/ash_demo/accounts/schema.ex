defmodule AshDemo.Accounts.Schema do
  use Absinthe.Schema
  use AshGraphql, api: [AshDemo.Api]


  use AshGraphql, domains: [AshDemo.Accounts]

  # use Ash.Graphql.Schema

  query do
    # Custom absinthe queries can be placed here
    # @desc "Get all users"
    # field :users, list_of(:user) do
    #   resolve &AshDemo.Accounts.User.read/3
    # end
  end

  mutation do
    # Custom absinthe mutations can be placed here
  end

  # Remove the subscription block if you don't need it
end
