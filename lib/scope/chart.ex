defmodule Lastfmex.Chart do
  import Defmodulep
  requirep Lastfmex.Service, as: Service

  @spec top_artists(String.t()) :: {:ok, map()} | {:error, :not_found}
  def top_artists(user_name), do: Service.call("chart.gettopartists", user_name)

  @spec top_tags(String.t(), Keyword.t()) :: {:ok, map()} | {:error, :not_found}
  def top_tags(user_name, opts \\ []), do: Service.call("chart.gettoptags", user_name, opts)

  @spec top_tracks(String.t(), Keyword.t()) :: {:ok, map()} | {:error, :not_found}
  def top_tracks(user_name, opts \\ []),
    do: Service.call("chart.gettoptracks", user_name, opts)
end
