defmodule FakeNewsWeb.NewsLive.Post.Edit do
  use FakeNewsWeb, :live_view

  alias FakeNews.News
  alias FakeNews.News.Post

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    post = News.get_post!(id)
    {:ok, assign(socket, %{post: post, changeset: News.change_post(post)})}
  end

  @impl true
  def handle_event("validate", %{"post" => params}, socket) do
    changeset =
      socket.assigns.post
      |> News.change_post(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, changeset: changeset)}
  end

  @impl true
  def handle_event("save", %{"post" => params}, socket) do
    case News.update_post(socket.assigns.post, params) do
      {:ok, post} ->
        {:noreply,
         socket
         |> put_flash(:info, gettext("Post updated"))
         |> push_redirect(
           to: Routes.news_post_show_path(socket, :show, post.id)
         )}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
