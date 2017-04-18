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

    resources "/states", StateController, except: [:new, :edit] do
      resources "/citys", CityController, except: [:new, :edit, :show, :update, :create, :delete]
    end

    resources "/citys", CityController, except: [:new, :edit] do
      resources "/events", EventController, except: [:new, :edit, :show, :update, :create, :delete]
      resources "/categories", CategoryController, except: [:new, :edit, :show, :update, :create, :delete] do
        resources "/events", EventController, except: [:new, :edit, :show, :update, :create, :delete]
      end
      resources "/carousel_events", CarouselEventController, except: [:new, :edit, :show, :update, :create, :delete]
    end

    resources "/events", EventController, except: [:new, :edit] do
      resources "/carousel_events", CarouselEventController, except: [:new, :edit, :show, :update, :create, :delete]
      resources "/event_photos", Event_PhotoController, except: [:new, :edit, :show, :update, :create, :delete]
      resources "/show_dates", ShowDateController, except: [:new, :edit, :show, :update, :create, :delete]
    end

    resources "/carousel_events", CarouselEventController, except: [:new, :edit]
    resources "/categories", CategoryController, except: [:new, :edit]
    resources "/event_photos", Event_PhotoController, except: [:new, :edit]
    resources "/show_dates", ShowDateController, except: [:new, :edit]
    resources "/date_hours", DateHourController, except: [:new, :edit]
  end

end
