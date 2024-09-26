defmodule AshDemo.Repo do
  use AshPostgres.Repo, otp_app: :ash_demo

  # Installs extensions that ash commonly uses
  def installed_extensions do
    ["ash-functions", "uuid-ossp", "citext"]
  end
end
