defmodule Test13.Web.Router do
  use Test13.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Test13.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Test13.Web do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show, :create, :delete, :update]
    resources "/admins", AdminController, only: [:index, :show, :create, :delete, :update]
  end
end
