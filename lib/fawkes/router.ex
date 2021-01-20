defmodule Fawkes.Router do
  use Plug.Router

  plug Plug.Logger

  plug :match
  plug Plug.Parsers,
    parsers: [:json, Absinthe.Plug.Parser],
    json_decoder: Jason

  plug :dispatch

  forward "/bot", to: Fawkes.Routes.Bot
  forward "/api", to: Fawkes.Routes.Api
  forward "/books", to: Fawkes.Routes.Books

  forward "/graphql",
    to: Absinthe.Plug,
    init_opts: [schema: Fawkes.Schema]

  forward "/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: Fawkes.Schema]

  match _ do
    send_resp(conn, 404, "Not found!")
  end
end