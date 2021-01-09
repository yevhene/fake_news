defmodule FakeNewsWeb.NewsLive.Post.New do
  use FakeNewsWeb, :live_view

  alias FakeNews.News
  alias FakeNews.News.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{changeset: News.change_post(%Post{})})}
  end

  @impl true
  def handle_event("validate", %{"post" => params}, socket) do
    changeset =
      %Post{}
      |> News.change_post(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  @impl true
  def handle_event("save", %{"post" => params}, socket) do
    case News.create_post(params) do
      {:ok, post} ->
        {:noreply,
         socket
         |> put_flash(:info, gettext("Post created"))
         |> push_redirect(
           to: Routes.news_post_show_path(socket, :show, post.id)
         )}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
