defmodule FakeNewsWeb.NewsLive.Post.Show do
  use FakeNewsWeb, :live_view

  alias FakeNews.News

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok, assign(socket, %{id: id, post: News.get_post!(id)})}
  end

  @impl true
  def handle_event("delete", _params, socket) do
    post = News.get_post!(socket.assigns[:id])

    case News.delete_post(post) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, gettext("Post deleted successfully"))
         |> push_redirect(to: Routes.news_post_index_path(socket, :index))}

      {:error, %Ecto.Changeset{} = _changeset} ->
        {:noreply,
         socket
         |> put_flash(:error, gettext("Error occured. Contact Admin"))
         |> push_redirect(to: Routes.news_post_index_path(socket, :index))}
    end
  end
end
