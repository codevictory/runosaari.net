defmodule Runosaari.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Runosaari.Repo,
      # Start the Telemetry supervisor
      RunosaariWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Runosaari.PubSub},
      # Start the Endpoint (http/https)
      RunosaariWeb.Endpoint
      # Start a worker by calling: Runosaari.Worker.start_link(arg)
      # {Runosaari.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Runosaari.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RunosaariWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
