defmodule Spotify.CurrentlyPlaying do
  defstruct ~w[
    timestamp
    context
    progress_ms
    item
    currently_playing_type
    actions
    is_playing
  ]a

  alias Spotify.Client
  use Spotify.Responder
  import Spotify.Helpers

  def currently_playing(conn) do
    conn |> Client.get(currently_playing_url()) |> handle_response
  end

  def currently_playing_url, do: "https://api.spotify.com/v1/me/player/currently-playing"

  def build_response(body) do
    to_struct(__MODULE__, body)
  end
end
