defmodule EventForum.Repo do
  use Ecto.Repo,
    otp_app: :event_forum,
    adapter: Ecto.Adapters.Postgres
end
