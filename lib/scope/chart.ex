defmodule Lastfmex.Chart do
  import Defmodulep
  requirep Lastfmex.Service, as: Service

  @spec get_top_artists(String.t()) :: {:ok, map()} | {:error, :not_found}
  def get_top_artists(user_name), do: Service.call("chart.gettopartists", user_name)

  @spec get_top_tags(String.t(), Keyword.t()) :: {:ok, map()} | {:error, :not_found}
  def get_top_tags(user_name, opts \\ []), do: Service.call("chart.gettoptags", user_name, opts)

  @spec get_top_tracks(String.t(), Keyword.t()) :: {:ok, map()} | {:error, :not_found}
  def get_top_tracks(user_name, opts \\ []),
    do: Service.call("chart.gettoptracks", user_name, opts)
end
