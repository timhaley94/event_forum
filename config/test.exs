use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :event_forum, EventForumWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :event_forum, EventForum.Repo,
  username: "timhaley",
  password: "timhaley",
  database: "event_forum_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
