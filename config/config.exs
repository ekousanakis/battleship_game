# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :battleship_game, BattleshipGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rKenykNku8Ce4LYJU4a6N4uGL7c8uIwuFowjqd/JZWQZFrk0vd4qboBXMrLaHje7",
  render_errors: [view: BattleshipGameWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BattleshipGame.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "../deps/battleship_server/config/config.exs"
