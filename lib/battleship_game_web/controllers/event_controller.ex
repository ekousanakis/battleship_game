defmodule BattleshipGameWeb.EventController do
  use BattleshipGameWeb, :controller

  # plug BattleshipGameWeb.AuthorizedPlug, "create" when action in [:create]
  plug BattleshipGameWeb.AuthorizedPlug when action in [:create]

  def show(conn, %{"game_id"=> game_id}) do
    event =
      BattleshipServer.Repo.get_by(Battleshipserver.Db.Game, game_id: game_id)
    render conn, "details.html", event: event
  end

  def list(conn, _params) do
    events = BattleshipServer.Repo.all(Battleshipserver.Db.Game)
    render conn, "list.html", events: events
end

  def create(conn, _params) do
    changeset = Battleshipserver.Db.Game.changeset(%Battleshipserver.Db.Game{}, %{})
    render conn, "create.html", changeset: changeset
  end

  def add(conn, %{"game"=> game}) do
    game= Map.put(game, "start_date", DateTime.utc_now())

    Battleshipserver.Db.Game.changeset(%Battleshipserver.Db.Game{}, game)
    |>BattleshipServer.Repo.insert!
    redirect conn, to: event_path(conn, :list)
  end

  def play(conn, %{"game_id"=> game_id, "winner"=> winner}) do

    g = BattleshipServer.Repo.get_by(Battleshipserver.Db.Game, game_id: game_id)
    |> Ecto.Changeset.change(end_date: DateTime.utc_now(), winner: winner )
    |> BattleshipServer.Repo.update

    redirect conn, to: event_path(conn, :show, game_id)
  end


end
