defmodule Lastfmex.User do
  import Defmodulep
  requirep(Lastfmex.Service, as: Service)

  @type paginate :: [limit: integer(), page: integer()]

  @spec get_info(String.t()) :: map() | {:error, :not_found}
  def get_info(user_name), do: Service.call("user.getinfo", user_name)

  @spec get_friends(String.t(), Keyword.t()) :: map() | {:error, :not_found}
  def get_friends(user_name, opts \\ []), do: Service.call("user.getfriends", user_name, opts)

  @spec get_loved_tracks(String.t(), Keyword.t()) :: map() | {:error, :not_found}
  def get_loved_tracks(user_name, opts \\ []),
    do: Service.call("user.getlovedtracks", user_name, opts)

  @spec get_top_albums(String.t(), paginate()) :: map() | {:error, :not_found}
  def get_top_albums(user_name, opts \\ []),
    do: Service.call("user.gettopalbums", user_name, opts)
end
