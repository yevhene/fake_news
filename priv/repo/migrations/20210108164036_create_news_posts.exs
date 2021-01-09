defmodule FakeNews.Repo.Migrations.CreateNewsPosts do
  use Ecto.Migration

  def change do
    create table(:news_posts) do
      add :title, :string
      add :short, :text
      add :content, :text
      add :image_url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
