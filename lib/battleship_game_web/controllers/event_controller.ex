defmodule BattleshipGameWeb.EventController do
  use BattleshipGameWeb, :controller

  def show(conn, %{"id" => id}) do
    # text conn, "events"
    event =
      BattleshipGameWeb.EventQueries.get_by_id(id)
    |> IO.inspect

    render conn, "details.html", events: event
  end
end
