defmodule FakeNewsWeb.NewsLive.Post.Index do
  use FakeNewsWeb, :live_view

  alias FakeNews.News

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{posts: News.list_posts()})}
  end
end
