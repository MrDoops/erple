defmodule Erple.MixProject do
  use Mix.Project

  def project do
    [
      app: :erple,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Erple.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commanded, "~> 0.17"},
      {:eventstore, "~> 0.13"},
      {:uuid, "~> 1.1"},
    ]
  end
end
