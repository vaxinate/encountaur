# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_encounter_thing,
  ecto_repos: [PhoenixEncounterThing.Repo]

# Configures the endpoint
config :phoenix_encounter_thing, PhoenixEncounterThing.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PimGd3dA+IPVogNBu+MygZsByj2PHxLarJjXxztcPQupLgUgAZPRz/O09EJ279ZF",
  render_errors: [view: PhoenixEncounterThing.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixEncounterThing.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
