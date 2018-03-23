defmodule BattleshipGameWeb.AuthorizedPlug do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts) do
    opts
  end

  def call(conn, _) do
    user_name = conn.cookies["user_name"]
    authorize_user(conn, user_name)
  end

  defp authorize_user(conn, nil) do
    conn
    |> redirect(to: "/login")
    |> halt
  end

  defp authorize_user(conn, user_name) do
    conn
  end

  # gia security wste na afineis sugkekrimena onomata username na mpainoun sto sustima
  # sundiazete me to plug BattleshipGameWeb.AuthorizedPlug, "username p theleis" when action in [:create]
  # mesa ston controller


  # def call(conn, name) do
  #   user_name = conn.cookies["user_name"]
  #   authorize_user(conn, user_name, name)
  # end

  # defp authorize_user(conn, nil, _) do
  #   conn
  #   |> redirect(to: "/login")
  #   |> halt
  # end

  # defp authorize_user(conn, user_name, name) when user_name ===name do
  #   conn
  # end

  # defp authorize_user(conn, _, _), do: authorize_user(conn, nil, nil)

end
