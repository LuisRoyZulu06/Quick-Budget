defmodule QuickBudgetWeb.SessionController do
  use QuickBudgetWeb, :controller

  alias QuickBudgetWeb.UserController
  alias QuickBudget.Logs
  alias QuickBudget.Auth

  def new(conn, _params) do
    render(conn, "login.html")
  end

  def login(conn, params) do
    with {:error, _reason} <- UserController.get_user_by_username(String.trim(params["username"])) do
      conn
      |> put_flash(:error, "Invalid login credentials.")
      |> render("login.html")
    else
      {:ok, user} ->
        with {:error, _reason} <- Auth.confirm_password(user, String.trim(params["password"])) do
          conn
          |> put_flash(:error, "Invalid login credentials.")
          |> render("login.html")
        else
          {:ok, _} ->
            cond do
              user.user_status == "ACTIVE" ->
                {:ok, _} = Logs.create_user_logs(%{user_id: user.id, activity: "logged in"})

                cond do
                  # ------------------------------------------------ Backoffice
                  user.user_type == "BACKOFFICE" ->
                    conn
                    |> put_session(:current_user, user.id)
                    |> put_session(:session_timeout_at, session_timeout_at())
                    |> redirect(to: Routes.user_path(conn, :dashboard))

                  # ------------------------------------------------ Client
                  user.user_type == "CLIENT" ->
                    conn
                    |> put_session(:current_user, user.id)
                    |> put_session(:session_timeout_at, session_timeout_at())
                    |> redirect(to: Routes.client_path(conn, :dashboard))
                end

              true ->
                conn
                # |> put_status(405)
                # |> put_layout(false)
                |> redirect(to: Routes.session_path(conn, :error_405))
            end
        end
    end
  end

  defp session_timeout_at do
    DateTime.utc_now() |> DateTime.to_unix() |> (&(&1 + 3_600)).()
  end

  def signout(conn, _params) do
    {:ok, _} = Logs.create_user_logs(%{user_id: conn.assigns.user.id, activity: "logged out"})

    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.session_path(conn, :new))
  rescue
    _ ->
      conn
      |> configure_session(drop: true)
      |> redirect(to: Routes.session_path(conn, :new))
  end

  def error_405(conn, _params) do
    render(conn, "disabled_account.html")
  end
end
