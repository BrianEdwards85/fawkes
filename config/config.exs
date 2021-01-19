use Mix.Config

config :fawkes, Fawkes.Repo,
  database: "fawkes",
  username: "fawkes",
  password: "fawkes",
  hostname: "192.168.26.2"

config :fawkes, ecto_repos: [Fawkes.Repo]

config :fawkes, port: 4000
config :fawkes, redirect_url: "http://localhost:4000/bot"

import_config "#{Mix.env()}.exs"
