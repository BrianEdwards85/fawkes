use Mix.Config

config :fawkes, port: 4000
config :fawkes, redirect_url: "http://localhost:4000/bot"

import_config "#{Mix.env()}.exs"
