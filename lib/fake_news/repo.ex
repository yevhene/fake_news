defmodule FakeNews.Repo do
  use Ecto.Repo,
    otp_app: :fake_news,
    adapter: Ecto.Adapters.Postgres
end
