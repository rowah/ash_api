[
  import_deps: [:ash, :ecto, :ecto_sql, :phoenix, :ash_phoenix, :ash_postgres, :ash_authentication, :ash_authentication_phoenix],
  subdirectories: ["priv/*/migrations"],
  plugins: [Spark.Formatter, Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
