defmodule Shorten.Repo do
  use Ecto.Repo,
    otp_app: :shortener_core,
    adapter: Ecto.Adapters.Postgres
end
