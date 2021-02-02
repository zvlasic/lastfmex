defmodule Lastfmex.Chart do
  import Defmodulep
  requirep Lastfmex.Service, as: Service

  @type error :: %{message: String.t(), error: String.t()}

  @spec top_artists(String.t()) :: {:ok, map()} | {:error, error()}
  def top_artists(user_name) do
    with {:ok, response} <- Service.call("chart.gettopartists", user_name),
         do: {:ok, response.artists}
  end

  @spec top_tags(String.t(), Keyword.t()) :: {:ok, map()} | {:error, error()}
  def top_tags(user_name, opts \\ []) do
    with {:ok, response} <- Service.call("chart.gettoptags", user_name, opts),
         do: {:ok, response.tags}
  end

  @spec top_tracks(String.t(), Keyword.t()) :: {:ok, map()} | {:error, error()}
  def top_tracks(user_name, opts \\ []) do
    with {:ok, response} <- Service.call("chart.gettoptracks", user_name, opts),
         do: {:ok, response.tracks}
  end
end
