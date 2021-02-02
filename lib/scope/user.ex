defmodule Lastfmex.User do
  import Defmodulep
  requirep Lastfmex.Service, as: Service

  @type period_length :: :overall | :"7day" | :"1month" | :"3month" | :"6month" | :"12month"
  @type error :: %{message: String.t(), error: String.t()}

  @spec info(user_name :: String.t()) :: {:ok, map()} | {:error, error()}
  def info(user_name) do
    with {:ok, response} <- Service.call("user.getinfo", user_name), do: {:ok, response.user}
  end

  @spec friends(user_name :: String.t(), limit: integer(), page: integer()) ::
          {:ok, map()} | {:error, error()}
  def friends(user_name, opts \\ []) do
    with {:ok, response} <- Service.call("user.getfriends", user_name, opts),
         do: {:ok, response.friends}
  end

  @spec loved_tracks(String.t(), limit: integer(), page: integer()) ::
          {:ok, map()} | {:error, error()}
  def loved_tracks(user_name, opts \\ []) do
    with {:ok, response} <- Service.call("user.getlovedtracks", user_name, opts),
         do: {:ok, response.lovedtracks}
  end

  @spec top_albums(String.t(), limit: integer(), page: integer(), period: period_length()) ::
          {:ok, map()} | {:error, error()}
  def top_albums(user_name, opts \\ []) do
    with {:ok, response} <- Service.call("user.gettopalbums", user_name, opts),
         do: {:ok, response.topalbums}
  end

  @spec top_tracks(String.t(), limit: integer(), page: integer(), period: period_length()) ::
          {:ok, map()} | {:error, error()}
  def top_tracks(user_name, opts \\ []) do
    with {:ok, response} <- Service.call("user.gettoptracks", user_name, opts),
         do: {:ok, response.toptracks}
  end
end
