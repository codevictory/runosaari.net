defmodule RunosaariWeb.Router do
  use RunosaariWeb, :router

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

  scope "/", RunosaariWeb do
    pipe_through :browser

    resources "/", IndexController, only: [:index]
    get "/covid19", PageController, :covid19
    get "/privacy", PageController, :privacy
    resources "/performers", PerformerController, only: [:index, :show]
    resources "/performances", PerformanceController, only: [:index]
    resources "/visitors", VisitorController, only: [:new, :create]
    get "/confirmation", VisitorController, :confirmation
    resources "/info", InfoController, only: [:index]
  end

  scope "/admin", RunosaariWeb, as: :admin do
    pipe_through :browser

    get "/index", IndexController, :admin
    resources "/index", IndexController, except: [:index]
    get "/performers", PerformerController, :admin
    get "/performances", PerformanceController, :admin
    resources "/performers", PerformerController, except: [:index, :show]
    resources "/performances", PerformanceController, except: [:index]
    resources "/visitors", VisitorController, except: [:new, :create]
    resources "/info", InfoController, except: [:index]
    get "/info", InfoController, :admin
    resources "/survival", SurvivalController, except: [:index]
    get "/survival", SurvivalController, :admin
    resources "/workshops", WorkshopController, except: [:index]
    get "/workshops", WorkshopController, :admin
  end

  # Other scopes may use custom stacks.
  # scope "/api", RunosaariWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/admin" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: RunosaariWeb.Telemetry
    end
  end
end
