defmodule Fawkes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Fawkes.Worker.start_link(arg)
      # {Fawkes.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: Fawkes.Router, options: [port: port()]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fawkes.Supervisor]

    Logger.info "The server listening at port: #{port()}"
    Supervisor.start_link(children, opts)
  end

  defp port, do: Application.get_env(:fawkes, :port, 8000)
end
