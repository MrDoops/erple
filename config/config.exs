use Mix.Config

config :erple, ecto_repos: [Erple.Repo]

if Mix.env() == :dev do
  config :mix_test_watch,
    setup_tasks: ["ecto.reset"],
    ansi_enabled: :ignore,
    clear: true
end

import_config "#{Mix.env}.exs"

# Configure the event store database
config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "erple_eventstore_prod",
  hostname: "localhost",
  pool_size: 10

# Configure the read store database
config :erple, Erple.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "erple_readstore_prod",
  hostname: "localhost",
  pool_size: 15
