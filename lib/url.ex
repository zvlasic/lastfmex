defmodule Lastfmex.URL do
  def form_url(method, user) do
    "http://ws.audioscrobbler.com/2.0"
    |> URI.parse()
    |> Map.put(:query, query_params(method, user))
    |> URI.to_string()
  end

  defp query_params(method, user) do
    URI.encode_query(%{
      "format" => "json",
      "api_key" => System.get_env("API_KEY"),
      "method" => method,
      "user" => user
    })
  end
end
