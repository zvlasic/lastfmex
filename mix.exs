defmodule Lastfmex.MixProject do
  use Mix.Project

  def project do
    [
      app: :lastfmex,
      version: "0.1.0",
      elixir: "~> 1.11.3",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.3"},
      {:defmodulep, "~> 0.1", github: "josevalim/defmodulep"},
      {:dialyxir, github: "jeremyjh/dialyxir", only: [:dev], runtime: false},
      {:httpoison, "~> 1.6"}
    ]
  end
end
