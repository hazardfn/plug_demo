defmodule PlugDemo.Router do
  use Plug.Router

  plug(:match)
  plug(Plug.Parsers, parsers: [:urlencoded])
  plug(:dispatch)

  forward(
    "/swagger/v1",
    to: PhoenixSwagger.Plug.SwaggerUI,
    init_opts: [otp_app: :plug_demo, swagger_file: "v1.json"]
  )
end
