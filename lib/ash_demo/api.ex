defmodule AshDemo.Api do
  use Ash.Api

  resources do
    resource AshDemo.Accounts.User
  end

  graphql do
    authorize? false
  end

  json_api do
    authorize? false
  end
end
