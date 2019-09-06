# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cards,
  ecto_repos: [Cards.Repo]

# Configures the endpoint
config :cards, CardsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "heU4u8nj+1FiuzAzGP1qKGjRGegNapufiXg5N5d8ZHs1i5yg5nedmixXjpHlU5MO",
  render_errors: [view: CardsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cards.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
