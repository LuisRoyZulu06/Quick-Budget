defmodule QuickBudgetWeb.Client.TransfersController do
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
  alias QuickBudget.Transfers.Transactions

  def depsoit(conn, params) do
    IO.inspect(conn, label: "===============================conn")
    prep_params = prep_params(params)

    Ecto.Multi.new()
    |> Ecto.Multi.insert(:txn_deposit, Transactions.changeset(%Transactions{}, prep_params))
    |> Ecto.Multi.run(:user_log, fn _repo, %{txn_deposit: txn_deposit} ->
      activity =
        "Deposited K#{txn_deposit.amount}, transaction reference number is #{txn_deposit.txn_reference}"

      user_log = %{user_id: conn.assigns.user.id, activity: activity}

      UserLogs.changeset(%UserLogs{}, user_log)
      |> Repo.insert()
    end)
    |> Repo.transaction()
    |> case do
      {:ok, %{txn_deposit: txn_deposit}} ->
        conn
        |> put_flash(:info, "K#{txn_deposit.amount} Deposited.")
        |> redirect(to: Routes.client_path(conn, :dashboard))

      {:error, _failed_operation, failed_value, _changes_so_far} ->
        error = traverse_errors(failed_value.errors)

        conn
        |> put_flash(:error, "Deposit failed. " <> error)
        |> redirect(to: Routes.client_path(conn, :dashboard))
    end

    # rescue
    #   _ ->
    #     conn
    #     |> put_flash(:error, "An error occured. Please inform system admin they will advise.")
    #     |> redirect(to: Routes.client_path(conn, :dashboard))
  end

  defp prep_params(params) do
    txn_ref = random_string(10)

    %{
      amount: params["amount"],
      narration: params["narration"],
      txn_type: "CR",
      acc_id: params["acc_id"],
      txn_reference: txn_ref
    }
  end

  def traverse_errors(errors) do
    errors = for {key, {msg, _opts}} <- errors, do: "#{key} #{msg}"
    List.first(errors)
  end

  def random_string(length) do
    :crypto.strong_rand_bytes(length)
    |> Base.url_encode64()
    |> binary_part(0, length)
  end
end
