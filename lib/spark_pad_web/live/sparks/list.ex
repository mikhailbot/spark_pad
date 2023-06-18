defmodule SparkPadWeb.Sparks.List do
  use SparkPadWeb, :live_view

  alias SparkPad.Ideas

  def mount(_params, _session, socket) do
    user = socket.assigns.current_user
    sparks = Ideas.list_sparks(user.id)

    socket = socket |> assign(sparks: sparks)

    {:ok, socket}
  end
end
