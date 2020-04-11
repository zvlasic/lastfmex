defmodule Lastfmex.User do
  import Lastfmex.Service

  def get_info(user_name), do: call("user.getinfo", user_name)
  def get_friends(user_name, opts \\ []), do: call("user.getfriends", user_name, opts)
  def get_loved_tracks(user_name, opts \\ []), do: call("user.getlovedtracks", user_name, opts)
  def get_top_albums(user_name, opts \\ []), do: call("user.gettopalbums", user_name, opts)
end
