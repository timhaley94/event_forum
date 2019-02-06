defmodule DoogaWeb.Router do
  use DoogaWeb, :router
  alias DoogaWeb.EventController

  @standard_routes [:index, :show, :create, :update, :delete]

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DoogaWeb do
    pipe_through :api

    resources "/events", EventController, only: @standard_routes
  end
end
