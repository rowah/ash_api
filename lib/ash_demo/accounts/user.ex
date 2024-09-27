defmodule AshDemo.Accounts.User do
  use Ash.Resource,
    domain: AshDemo.Accounts,
    data_layer: AshPostgres.DataLayer,
    # If using policies, enable the policy authorizer:
    authorizers: [Ash.Policy.Authorizer],

    extensions: [AshAuthentication, AshGraphql.Resource, AshJsonApi.Resource]

  graphql do
    type :user

    queries do
      # create a field called `get_user` that uses the `read` read action to fetch a single user
      get :get_user, :read
      # create a field called `list_users` that uses the `read` read action to fetch a list of users
      list :list_users, :read
    end

    mutations do
      create :create_user, :create
      update :update_user, :update
      destroy :destroy_user, :destroy
    end
  end

  json_api do
    type "user"

    routes do
      base "/users"
      get :read
      index :read
      post :create
      patch :update
      delete :destroy
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :email, :ci_string do
      allow_nil? false
      public? true
    end

    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true

    attribute :name, :string
  end

  actions do
    defaults [:create, :read, :update, :destroy]

    read :list_all do
      primary? true
    end

    read :profile do
      get? true
    end
  end

  authentication do
    strategies do
      password :password do
        identity_field :email
      end
    end

    tokens do
      enabled? true
      token_resource AshDemo.Accounts.Token
      signing_secret AshDemo.Accounts.Secrets
    end
  end

  policies do
    policy action_type(:create) do
      authorize_if always()
    end

    policy action(:list_all) do
      authorize_if always()
    end

    # policy action(:profile) do
    #   authorize_if expr(actor.id == ^resource.id)
    # end

    policy always() do
      authorize_if relates_to_actor_via(:id)
    end
  end

  postgres do
    table "users"
    repo AshDemo.Repo
  end

  identities do
    identity :unique_email, [:email]
  end

  # If using policies, add the following bypass:
  policies do
    bypass AshAuthentication.Checks.AshAuthenticationInteraction do
      authorize_if always()
    end
  end
end
