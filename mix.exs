defmodule PlugDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_demo,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {PlugDemo.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, ">= 0.0.0"},
      {:cowboy, ">= 0.0.0"},
      {:poison, ">= 0.0.0"},
      {:phoenix_swagger, ">= 0.0.0"}
    ]
  end
end
