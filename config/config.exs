# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :examiner,
  ecto_repos: [Examiner.Repo]

# Configures the endpoint
config :examiner, Examiner.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ONIqPS8c8D2KkYiuaCKA6C4064SguVtdRwILBSgFzGFQmWOk3/U542BswMSDVpiA",
  render_errors: [view: Examiner.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Examiner.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
