defmodule Lastfmex.User do
  import Defmodulep
  requirep Lastfmex.Service, as: Service

  @type period_length :: :overall | :"7day" | :"1month" | :"3month" | :"6month" | :"12month"

  @spec get_info(user_name :: String.t()) :: map() | {:error, :not_found}
  def get_info(user_name), do: Service.call("user.getinfo", user_name)

  @spec get_friends(user_name :: String.t(),
          limit: integer(),
          page: integer()
        ) :: map() | {:error, :not_found}
  def get_friends(user_name, opts \\ []), do: Service.call("user.getfriends", user_name, opts)

  @spec get_loved_tracks(String.t(),
          limit: integer(),
          page: integer()
        ) :: map() | {:error, :not_found}
  def get_loved_tracks(user_name, opts \\ []),
    do: Service.call("user.getlovedtracks", user_name, opts)

  @spec get_top_albums(String.t(), limit: integer(), page: integer(), period: period_length()) ::
          map() | {:error, :not_found}
  def get_top_albums(user_name, opts \\ []),
    do: Service.call("user.gettopalbums", user_name, opts)
end
