defmodule QuickBudgetWeb.Router do
  use QuickBudgetWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(QuickBudgetWeb.Plugs.SetUser)
  end

  pipeline :client do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_layout, {QuickBudgetWeb.LayoutView, :client}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(QuickBudgetWeb.Plugs.SetUser)
  end

  pipeline :admin do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_layout, {QuickBudgetWeb.LayoutView, :admin}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(QuickBudgetWeb.Plugs.SetUser)
  end

  pipeline :session do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:put_secure_browser_headers)
    plug(:put_layout, {QuickBudgetWeb.LayoutView, :login})
  end

  pipeline :no_layout do
    plug :put_layout, false
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # ------------- NO LAYOUT SCOPE
  scope "/", QuickBudgetWeb do
    pipe_through([:browser, :no_layout])
    get("/logout/current/user", SessionController, :signout)
    # get("/new/password", UserController, :new_password)
  end

  # ------------- SESSION SCOPE
  scope "/", QuickBudgetWeb do
    pipe_through :session
    get("/", SessionController, :new)
    post("/login", SessionController, :login)
    # get("/registration", SessionController, :registration)
    # post("/sef/registration", UserController, :self_registration)
    # get("/admin/login", SessionController, :admin_login)
    # get("/backoffice", SessionController, :backoffice)
    # get("/account/disabled", SessionController, :error_405)
    # get("/forgort/password", UserController, :forgot_password)
    # post("/confirmation/token", UserController, :token)
    # get("/reset/password", UserController, :default_password)
  end

  # --------------- CLIENT
  scope "/", QuickBudgetWeb.Client do
    pipe_through :client

    get("/dashboard", ClientController, :dashboard)
    post("/deposit/cash", TransfersController, :depsoit)
    post("/budget/items", TransfersController, :budget_items)
    post("/pull/budget/items", TransfersController, :pull_budget_items)
  end

  # --------------- BACKOFFICE
  # scope "/", QuickBudgetWeb.Admin do
  #   pipe_through :admin
  #
  #   get("/dashboard", AdminController, :dashboard)
  #   get("/my/profile", AdminController, :admin_profile)
  #   get("/backoffice/users", AdminController, :admin_users)
  #   post("/create/new/admin", AdminController, :create_admin)
  #   post("/pull/admin/users", AdminController, :get_admin_users)
  #   get("/front/users", AdminController, :client_users)
  #
  #   # ---------- User Roles
  #   get("/user/roles", AdminController, :usr_roles)
  #
  #   # ---------- configurations
  #   get("/MNOs", ConfigController, :mnos)
  #   post("/add/new/mno", ConfigController, :create_mno)
  #   post("/update/mno/details", ConfigController, :update_mno)
  #   get("/utility/configurations", ConfigController, :utility_configs)
  #   post("/add/new/service/provider", ConfigController, :create_service_provider)
  # end

  # Other scopes may use custom stacks.
  # scope "/api", InternetBankingWeb do
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

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: InternetBankingWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
