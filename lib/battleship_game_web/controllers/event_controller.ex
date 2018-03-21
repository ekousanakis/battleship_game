defmodule BattleshipGameWeb.EventController do
  use BattleshipGameWeb, :controller

  def show(conn, %{"id"=> id}) do
    event =
      BattleshipServer.Repo.get_by(Battleshipserver.Db.Game, game_id: id)
    render conn, "details.html", event: event
  end

  def list(conn, _params) do
    events = BattleshipServer.Repo.get_all
    render conn, "list.html", events: events
  end
end
