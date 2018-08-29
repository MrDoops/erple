use Mix.Config

config :erple, Erple.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "erple_readstore_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :eventstore, EventStore.Storage,
  serializer: EventStore.TermSerializer,
  username: "postgres",
  password: "postgres",
  database: "erple_eventstore_dev",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5
