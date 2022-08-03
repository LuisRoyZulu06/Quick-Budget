defmodule QuickBudgetWeb.ClientController do
  use QuickBudgetWeb, :controller
  import Ecto.Query, warn: false
  alias QuickBudget.Repo
  alias QuickBudget.Auth
  alias QuickBudget.Logs
  alias QuickBudget.Emails
  alias QuickBudget.Accounts
  alias QuickBudget.Emails.Email
  alias QuickBudget.Logs.UserLogs
  alias QuickBudget.Accounts.UserAccounts

  def dashboard(conn, _params) do
    render(conn, "dashboard.html")
  end
end
