defmodule Lastfmex do
  alias Lastfmex.User

  defdelegate get_user_info(user_name), to: User, as: :get_info
  defdelegate get_user_friends(user_name, opts \\ []), to: User, as: :get_friends
  defdelegate get_user_loved_tracks(user_name, opts \\ []), to: User, as: :get_loved_tracks
  defdelegate get_user_top_albums(user_name, opts \\ []), to: User, as: :get_top_albums
end
