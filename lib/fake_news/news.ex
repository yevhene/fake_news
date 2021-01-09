defmodule FakeNews.News do
  import Ecto.Query, warn: false

  alias FakeNews.Repo
  alias FakeNews.News.Post

  def list_posts() do
    Post
    |> Repo.all()
  end

  def get_post!(id), do: Repo.get(Post, id)

  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> change_post(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs \\ %{}) do
    post
    |> change_post(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    post
    |> change_post
    |> Repo.delete()
  end
end
