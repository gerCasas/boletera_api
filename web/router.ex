defmodule BoleteraApi.Router do
  use BoleteraApi.Web, :router

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

  scope "/", BoleteraApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", BoleteraApi do
    pipe_through :api

    resources "/citys", CityController, except: [:new, :edit] do
      resources "/states", StateController, except: [:new, :edit]
    end

    resources "/states", StateController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
  end

end
