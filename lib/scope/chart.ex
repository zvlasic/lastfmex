defmodule Lastfmex.Chart do
  import Lastfmex.Service

  @spec get_top_artists(String.t()) :: map() | {:error, :not_found}
  def get_top_artists(user_name), do: call("chart.gettopartists", user_name)

  @spec get_top_tags(String.t(), Keyword.t()) :: map() | {:error, :not_found}
  def get_top_tags(user_name, opts \\ []), do: call("chart.gettoptags", user_name, opts)

  @spec get_top_tracks(String.t(), Keyword.t()) :: map() | {:error, :not_found}
  def get_top_tracks(user_name, opts \\ []), do: call("chart.gettoptracks", user_name, opts)
end
