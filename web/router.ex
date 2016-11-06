defmodule Encountaur.Router do
  use Encountaur.Web, :router

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

  scope "/", Encountaur do
    pipe_through :browser # Use the default browser stack

    get "/encounters",     EncounterController, :index
    get "/encounters/:id", EncounterController, :show

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Encountaur do
    pipe_through :api

    resources "/actors", ActorController, except: [:new, :edit]
  end
end
