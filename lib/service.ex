defmodule Lastfmex.Service do
  @spec call(String.t(), String.t(), Keyword.t()) :: map() | {:error, :not_found}
  def call(api_method, user_name, optional \\ []) do
    {:ok, response} =
      "http://ws.audioscrobbler.com/2.0"
      |> URI.parse()
      |> Map.put(:query, query_params(api_method, user_name, optional))
      |> URI.to_string()
      |> HTTPoison.get()

    case response.status_code do
      200 -> Jason.decode!(response.body, keys: :atoms)
      404 -> {:error, :not_found}
    end
  end

  defp query_params(method, user, optional) do
    params =
      Keyword.merge(
        [
          format: "json",
          api_key: System.fetch_env!("API_KEY"),
          method: method,
          user: user
        ],
        optional
      )

    URI.encode_query(params)
  end
end
