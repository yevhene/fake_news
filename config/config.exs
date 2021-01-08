# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fake_news,
  ecto_repos: [FakeNews.Repo]

# Configures the endpoint
config :fake_news, FakeNewsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "wOUuQq7uEXZpCMrDQ4jWUEqBBL6OFf9MAGta4QsEk1sfQKEuIjNubo1DDZkCYc2H",
  render_errors: [
    view: FakeNewsWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: FakeNews.PubSub,
  live_view: [signing_salt: "k9D4WBdK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
