defmodule PlugDemo.Application do
  use Application

  def start(_, _) do
    :ets.new(:db, [:public, :named_table])

    children = [
      Plug.Adapters.Cowboy2.child_spec(
        scheme: :http,
        plug: PlugDemo.Router,
        options: [port: 4000]
      )
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end
