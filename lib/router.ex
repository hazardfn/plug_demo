defmodule PlugDemo.Router do
  use Plug.Router

  plug(:match)
  plug(Plug.Parsers, parsers: [:urlencoded]) # NOT MANDATORY
  plug(:dispatch)

  forward(
    "/swagger/v1",
    to: PhoenixSwagger.Plug.SwaggerUI,
    init_opts: [otp_app: :plug_demo, swagger_file: "v1.json"]
  )

  forward(
    "/swagger/v2",
    to: PhoenixSwagger.Plug.SwaggerUI,
    init_opts: [otp_app: :plug_demo, swagger_file: "v2.json"]
  )

  post "/:version" do
    conn = fetch_query_params(conn)
    mod  = build_module(version, "Post")
    mod.call(conn)
  end

  get "/:version" do
    conn = fetch_query_params(conn)
    mod  = build_module(version, "Get")
    mod.call(conn)
  end

  defp build_module(version, method) do
    version = version |> to_string() |> String.upcase()
    Module.safe_concat([PlugDemo, version, method])
  end
end
