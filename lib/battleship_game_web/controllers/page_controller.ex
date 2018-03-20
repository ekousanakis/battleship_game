defmodule BattleshipGameWeb.PageController do
  use BattleshipGameWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
