defmodule LastfmexTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "get request" do
    use_cassette "httpoison_get" do
      {:ok, response} = Lastfmex.User.get_top_albums("evil_zlayo", limit: 3)

      assert Enum.any?(Map.keys(response), &(&1 == :topalbums))
      assert response.topalbums."@attr".user == "evil_zlayo"
      assert length(response.topalbums.album) == 3
    end
  end
end
