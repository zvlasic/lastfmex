import Defmodulep

defmodulep Lastfmex.Service, visible_to: [Lastfmex.Chart, Lastfmex.User] do
  use HTTPoison.Base

  @spec call(String.t(), String.t(), Keyword.t()) :: map() | {:error, :not_found}
  def call(api_method, username, opts \\ []) do
    case call_lastfm_api(api_method, username, opts) do
      {:ok, response} -> process_success(response)
      {:error, error} -> process_error(error)
    end
  end

  def process_response_body(body), do: Jason.decode!(body, keys: :atoms)

  defp call_lastfm_api(api_method, username, opts) do
    params =
      Keyword.merge(
        [
          format: "json",
          api_key: System.fetch_env!("LASTFMEX_KEY"),
          method: api_method,
          user: username
        ],
        opts
      )

    __MODULE__.get("http://ws.audioscrobbler.com/2.0", [], params: params)
  end

  defp process_success(response) do
    if response.status_code == 200,
      do: {:ok, response.body},
      else: {:error, response.body}
  end

  defp process_error(error), do: {:error, %{error: nil, message: error.reason}}
end
