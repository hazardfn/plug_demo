defmodule PlugDemo.Application do
  alias PlugDemo.Router
  use Application

  def start(_, _) do
    :ets.new(:db, [:public, :named_table])

    children = [
      Plug.Adapters.Cowboy2.child_spec(
        scheme: :http,
        plug: Router,
        options: [port: 4000, max_connections: :infinity, acceptors: 200]
      )
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end
