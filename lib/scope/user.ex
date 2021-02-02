defmodule Lastfmex.User do
  import Defmodulep
  requirep Lastfmex.Service, as: Service

  @type period_length :: :overall | :"7day" | :"1month" | :"3month" | :"6month" | :"12month"

  @spec info(user_name :: String.t()) :: {:ok, map()} | {:error, :not_found}
  def info(user_name), do: Service.call("user.getinfo", user_name)

  @spec friends(user_name :: String.t(),
          limit: integer(),
          page: integer()
        ) :: {:ok, map()} | {:error, :not_found}
  def friends(user_name, opts \\ []), do: Service.call("user.getfriends", user_name, opts)

  @spec loved_tracks(String.t(),
          limit: integer(),
          page: integer()
        ) :: {:ok, map()} | {:error, :not_found}
  def loved_tracks(user_name, opts \\ []),
    do: Service.call("user.getlovedtracks", user_name, opts)

  @spec top_albums(String.t(), limit: integer(), page: integer(), period: period_length()) ::
          {:ok, map()} | {:error, :not_found}
  def top_albums(user_name, opts \\ []),
    do: Service.call("user.gettopalbums", user_name, opts)

  @spec top_tracks(String.t(), limit: integer(), page: integer(), period: period_length()) ::
          {:ok, map()} | {:error, :not_found}
  def top_tracks(user_name, opts \\ []),
    do: Service.call("user.gettoptracks", user_name, opts)
end
