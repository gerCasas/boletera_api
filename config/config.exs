# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :boletera_api,
  ecto_repos: [BoleteraApi.Repo]

# Configures the endpoint
config :boletera_api, BoleteraApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rVQUjH+vsHYxp1tDXi4tt9aucayIW4rhSJLWSp8WD/43+y5aPoW1eJVaTmgk30y5",
  render_errors: [view: BoleteraApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BoleteraApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
