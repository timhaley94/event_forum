defmodule DoogaWeb.EventController do
  use DoogaWeb, :controller
  import ShorterMaps
  alias Dooga.Forum
  alias Dooga.Forum.Event

  action_fallback DoogaWeb.FallbackController

  defp render_many(conn, events) do
    conn
    |> render("index.json", ~M{events})
  end

  defp render_one(conn, event) do
    conn
    |> render("show.json", ~M{event})
  end

  def index(conn, _params) do
    conn
    |> render_many(%{events: Forum.list_events()})
  end

  def create(conn, %{"event" => params}) do
    with {:ok, %Event{} = event} <- Forum.create_event(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.event_path(conn, :show, event))
      |> render_one(event)
    end
  end

  def show(conn, %{"id" => id}) do
    conn
    |> render_one(Forum.get_event!(id))
  end

  def update(conn, %{"id" => id, "event" => params}) do
    event = Forum.get_event!(id)

    with {:ok, %Event{} = event} <- Forum.update_event(event, params) do
      conn
      |> render_one(event)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Forum.get_event!(id)

    with {:ok, %Event{}} <- Forum.delete_event(event) do
      send_resp(conn, :no_content, "")
    end
  end
end
