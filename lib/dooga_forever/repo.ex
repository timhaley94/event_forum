defmodule Dooga.Repo do
  use Ecto.Repo,
    otp_app: :dooga_forever,
    adapter: Ecto.Adapters.Postgres
end
