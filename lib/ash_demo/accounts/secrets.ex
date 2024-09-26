defmodule AshDemo.Accounts.Secrets do
  use AshAuthentication.Secret

  def secret_for([:authentication, :tokens, :signing_secret], AshDemo.Accounts.User, _) do
    case Application.fetch_env(:ash_demo, AshDemoWeb.Endpoint) do
      {:ok, endpoint_config} ->
        Keyword.fetch(endpoint_config, :secret_key_base)
      :error ->
        :error
    end
  end
end
