defmodule EventForumWeb.Router do
  use EventForumWeb, :router
  alias EventForumWeb.EventController

  @standard_routes [:index, :show, :create, :update, :delete]

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EventForumWeb do
    pipe_through :api

    resources "/events", EventController, only: @standard_routes
  end
end
