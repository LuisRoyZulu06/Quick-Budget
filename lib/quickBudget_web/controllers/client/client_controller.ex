defmodule QuickBudgetWeb.Client.ClientController do
  use QuickBudgetWeb, :controller
  import Ecto.Query, warn: false
  alias QuickBudget.Repo
  alias QuickBudget.Auth
  alias QuickBudget.Logs
  alias QuickBudget.Emails
  alias QuickBudget.Accounts
  alias QuickBudget.Transfers
  alias QuickBudget.Emails.Email
  alias QuickBudget.Logs.UserLogs
  alias QuickBudget.Accounts.UserAccounts
  alias QuickBudget.Transfers.BankAccount
  alias QuickBudget.Transfers.BankCredit

  def dashboard(conn, _params) do
    # user = conn.assigns.user
    # acc_details = Transfers.get_acc_details(user.id)
    # render(conn, "dashboard.html", acc_details: acc_details)
    render(conn, "dashboard.html")
  end

  def budget_items(conn, _params) do
    render(conn, "budget_items.html")
  end

  def user_profile(conn, _params) do
    render(conn, "my_profile.html")
  end

  def about_us(conn, _params) do
    render(conn, "about_us.html")
  end
end
