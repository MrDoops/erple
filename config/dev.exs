use Mix.Config

config :eventstore, EventStore.Storage,
  serializer: EventStore.TermSerializer,
  username: "postgres",
  password: "postgres",
  database: "erple_eventstore_dev",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5
