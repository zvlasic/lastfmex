defmodule Lastfmex do
  alias Lastfmex.URL

  @moduledoc """
  Documentation for `Lastfmex`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Lastfmex.hello()
      :world

  """
  def hello do
    {:ok, response} =
      URL.form_url("user.getinfo", "evil_zlayo")
      |> HTTPoison.get()

    response.body
    |> Poison.decode!()
  end
end
