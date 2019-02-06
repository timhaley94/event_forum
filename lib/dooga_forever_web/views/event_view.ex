defmodule DoogaWeb.EventView do
  use DoogaWeb, :view
  alias __MODULE__
  import ShorterMaps

  def render("index.json", ~M{events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", ~M{event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", ~M{event}) do
    %{
      id: event.id
    }
  end
end
