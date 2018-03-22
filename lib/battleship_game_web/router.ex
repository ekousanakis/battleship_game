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

    get "/events", EventController, :list
    get "/events/new", EventController, :create
    post "/events/new", EventController, :add
    get "/events/:game_id", EventController, :show
    post "/events/:game_id/reserve", EventController, :play
  end


  # Other scopes may use custom stacks.
  # scope "/api", BattleshipGameWeb do
  #   pipe_through :api
  # end
end
