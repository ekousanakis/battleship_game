defmodule BattleshipGameWeb.EventChannel do
  use Phoenix.Channel

  # # mporei na gieni kapoios elegxos me to gameid an den uparxei gia security reasons
  # #  den mporw na to kanw edw giati to game id einai ontws miktoreto tou miden
  # def join("game:" <> game_id, _message, socket) when game_id<=0 do
  #   {:error, %{reason: "invalid event id"}}
  # end

  def join("event:" <> game_id, _message, socket)  do
    {:ok, socket}
  end

  def send_update(event)  do

    payload = %{"winner"=> event.winner}
    BattleshipGameWeb.Endpoint.broadcast("event:#(event.game_id)", "update_winner", payload)
  end

end
