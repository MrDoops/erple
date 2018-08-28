defmodule Erple.MixProject do
  use Mix.Project

  @name :erple
  @version "0.1.0"

  @deps [
    {:commanded, "~> 0.17"},
    {:commanded_eventstore_adapter, "~> 0.3"},
    {:uuid, "~> 1.1"},
    {:ecto, "~> 2.1"},
    {:jason, "~> 1.1"},
    {:postgrex, "~> 0.13.2"},
  ]

  @aliases [
    "ecto.reset": ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate"],
    "test.once": ["ecto.reset", "test"]
  ]

  def project do
    in_production = Mix.env() == :prod

    [
      app: @name,
      version: @version,
      elixir: "~> 1.6",
      deps: @deps,
      aliases: @aliases,
      build_embedded: in_production,
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [
        :logger,
        :eventstore,
      ],
      mod: {Erple.Application, []}
    ]
  end

end
