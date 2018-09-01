defmodule Erple.Application do
  use Application

  def start(_type, _args) do

    children = [
      Erple.Repo,
    ]

    opts = [strategy: :one_for_one, name: Erple.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
