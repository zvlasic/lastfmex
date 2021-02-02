defmodule LastfmexTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "get request" do
    use_cassette "httpoison_get" do
      {:ok, response} = Lastfmex.User.top_albums("evil_zlayo", limit: 3)

      assert Enum.any?(Map.keys(response), &(&1 == :topalbums))
      assert response.topalbums."@attr".user == "evil_zlayo"
      assert length(response.topalbums.album) == 3
    end
  end

  test "report error" do
    use_cassette "httpoison_get_error" do
      {:error, error} = Lastfmex.User.top_albums("evil_zlayo", limit: 10_000)

      assert error.error == 6
      assert error.message == "limit param out of bounds (1-1000)"
    end
  end
end
