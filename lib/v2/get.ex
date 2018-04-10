defmodule PlugDemo.V2.Get do

  def call(conn) do
    query_params = conn.query_params
    key = query_params["key"]

    IO.puts "I Went to V2"
    case :ets.lookup(:db, key) do
      [{_, map}] ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, Poison.encode!(map))
      [] ->
        conn
        |> Plug.Conn.send_resp(404, "Not found!")
    end
  end

end
