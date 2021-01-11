defmodule Fawkes.Endpoint do
  use Plug.Router


  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    with {:ok, [port: port] = config} <- config() do
      Logger.info("Starting server at http://localhost:#{port}/")
      Plug.Cowboy.http(__MODULE__, [], config)
    end
  end

  defp config, do: Application.fetch_env(:fawkes, __MODULE__)
  defp redirect_url, do: Application.get_env(:fawkes, :redirect_url)

  forward("/bot", to: Fawkes.Router)

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end
