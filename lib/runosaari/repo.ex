defmodule Runosaari.Repo do
  use Ecto.Repo,
    otp_app: :runosaari,
    adapter: Ecto.Adapters.Postgres
end
