use Mix.Config

config :erple, Erple.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "erple_readstore_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 1

config :ex_unit, capture_log: true

# Configure the event store database
config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "erple_eventstore_test",
  hostname: "localhost",
  pool_size: 1

config :logger,
  backends: [:console],
  level: :warn,
  compile_time_purge_level: :info
