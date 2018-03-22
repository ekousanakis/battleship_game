defmodule BattleshipGameWeb.Router do
  use BattleshipGameWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :authorized do
  #   plug :browser
  #   plug BattleshipGameWeb.AuthorizedPlug
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BattleshipGameWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", LoginController, :index
    post "/login", LoginController, :login
  end

  scope "/events", BattleshipGameWeb do
    pipe_through :browser # Use the default browser stack
    get "/", EventController, :list
    get "/new", EventController, :create
    post "/new", EventController, :add
    get "/:game_id", EventController, :show

  end

  # Other scopes may use custom stacks.
  # scope "/api", BattleshipGameWeb do
  #   pipe_through :api
  # end
end
