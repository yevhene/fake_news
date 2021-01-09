defmodule FakeNews.News.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news_posts" do
    field :content, :string
    field :image_url, :string
    field :short, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :short, :content, :image_url])
    |> validate_required([:title, :short, :content, :image_url])
  end
end
