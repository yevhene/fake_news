defmodule FakeNewsWeb.ArticleLive.Index do
  use FakeNewsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
