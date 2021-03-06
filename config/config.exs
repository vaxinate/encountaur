# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :encountaur,
  ecto_repos: [Encountaur.Repo]

# Configures the endpoint
config :encountaur, Encountaur.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PimGd3dA+IPVogNBu+MygZsByj2PHxLarJjXxztcPQupLgUgAZPRz/O09EJ279ZF",
  render_errors: [view: Encountaur.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Encountaur.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
