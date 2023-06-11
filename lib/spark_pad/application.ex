defmodule SparkPad.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SparkPadWeb.Telemetry,
      # Start the Ecto repository
      SparkPad.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SparkPad.PubSub},
      # Start Finch
      {Finch, name: SparkPad.Finch},
      # Start the Endpoint (http/https)
      SparkPadWeb.Endpoint
      # Start a worker by calling: SparkPad.Worker.start_link(arg)
      # {SparkPad.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SparkPad.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SparkPadWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
