defmodule Lastfmex.Service do
  @spec call(String.t(), String.t(), Keyword.t()) :: map() | {:error, :not_found}
  def call(api_method, user_name, optional \\ []) do
    with :ok <- sanitize(api_method, optional) do
      {:ok, response} =
        "http://ws.audioscrobbler.com/2.0"
        |> URI.parse()
        |> Map.put(:query, query_params(api_method, user_name, optional))
        |> URI.to_string()
        |> HTTPoison.get()

      case response.status_code do
        200 -> Poison.decode!(response.body)
        404 -> {:error, :not_found}
      end
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

  defp sanitize(_any, []), do: :ok

  defp sanitize(api_method, optional) when is_list(optional) do
    case Keyword.keys(optional) in optional(api_method) do
      true -> :ok
      false -> {:error, optional -- optional(api_method)}
    end
  end

  defp sanitize(_api_method, _opts), do: {:error, :improper_params}

  defp optional("user.getfriends"), do: [:recenttracks, :limit, :page]
  defp optional("user.getlovedtracks"), do: [:limit, :page]
  defp optional("user.gettopalbums"), do: [:period, :limit, :page]

  defp optional("chart.gettopartists"), do: [:limit, :page]
  defp optional("chart.gettoptags"), do: [:limit, :page]
  defp optional("chart.gettoptracks"), do: [:limit, :page]
end
