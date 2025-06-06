defmodule ShortenerCore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
require Logger

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ShortenerCore.Worker.start_link(arg)
      # {ShortenerCore.Worker, arg}
      Shorten.Repo,
      {Plug.Cowboy, scheme: :http, plug: Cowboy.HttpRouter, options: [port: 8080]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShortenerCore.Supervisor]
    Logger.info("Starting application...")
    Supervisor.start_link(children, opts)
  end
end
