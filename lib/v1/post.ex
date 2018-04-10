defmodule PlugDemo.V1.Post do

  def call(conn) do
    body_params = conn.body_params
    key = body_params["key"]
    value = body_params["value"]
    ets_value = %{key: key, value: value, created_at: DateTime.utc_now() |> to_string}

    :ets.insert_new(:db, {key, ets_value})

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(200, Poison.encode!(ets_value))
  end

end
