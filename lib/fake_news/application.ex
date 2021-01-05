defmodule FakeNews.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FakeNews.Repo,
      # Start the Telemetry supervisor
      FakeNewsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FakeNews.PubSub},
      # Start the Endpoint (http/https)
      FakeNewsWeb.Endpoint
      # Start a worker by calling: FakeNews.Worker.start_link(arg)
      # {FakeNews.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FakeNews.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FakeNewsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
