defmodule QuickBudgetWeb.Client.BudgetController do
  use QuickBudgetWeb, :controller
  import Ecto.Query, warn: false
  alias QuickBudget.Repo
  alias QuickBudget.Auth
  alias QuickBudget.Logs
  alias QuickBudget.Budget
  alias QuickBudget.Logs.UserLogs
  alias QuickBudget.Budget.BudgetItems
  alias QuickBudget.Budget.BudgetAmount

  def index(conn, params) do
    IO.inspect "********** BUDGET REF CHECK ************"
    IO.inspect params
    # user_id = conn.assigns.user.id
    # budget_amnt = Budget.total_budget(budget_ref);
    budget_items = Budget.budget_items();
    render(conn, "index.html", budget_items: budget_items)
  end

  def set_budget_amount(conn, params) do
    prep_params = prep_params(params)

    IO.inspect "********** PARAMS ************"
    IO.inspect params

    Ecto.Multi.new()
    # |> Ecto.Multi.insert(:item, BudgetAmount.changeset(%BudgetAmount{}, params))
    |> Ecto.Multi.insert(:item, BudgetAmount.changeset(%BudgetAmount{}, prep_params))
    |> Ecto.Multi.run(:user_log, fn _repo, %{item: item} ->
      activity = "User of ID #{conn.assigns.user.id}, has set budget with ID #{item.id}."

      user_log = %{
        user_id: conn.assigns.user.id,
        activity: activity
      }

      UserLogs.changeset(%UserLogs{}, user_log)
      |> Repo.insert()
    end)
    |> Repo.transaction()
    |> case do
      {:ok, %{item: _item, user_log: _user_log}} ->
        conn
        |> put_flash(:info, "New budget has been set successfully")
        |> redirect(to: Routes.budget_path(conn, :index))

      {:error, _failed_operation, failed_value, _changes_so_far} ->
        error = traverse_errors(failed_value.errors)

        conn
        |> put_flash(:error, "Failed to set budget because " <> error)
        |> redirect(to: Routes.budget_path(conn, :index))
    end

    # rescue
    # _ ->
    #   conn
    #   |> put_flash(:error, "An error occurred, reason unknown. try again")
    #   |> redirect(to: Routes.bank_path(conn, :index))
  end

  # def set_budget_amount(conn, params) do
  #   prep_params = prep_params(params)
  #   params = to_atomic_map(params)

  #   IO.inspect "********** PARAMS ************"
  #   IO.inspect params

  #   Ecto.Multi.new()
  #   # |> Ecto.Multi.insert(:item, BudgetAmount.changeset(%BudgetAmount{}, params))
  #   |> Ecto.Multi.insert(:item, BudgetAmount.changeset(%BudgetAmount{}, Map.put(params, :status, "OPEN")))
  #   |> Ecto.Multi.run(:user_log, fn _repo, %{item: item} ->
  #     activity = "User of ID #{conn.assigns.user.id}, has set budget with ID #{item.id}."

  #     user_log = %{
  #       user_id: conn.assigns.user.id,
  #       activity: activity
  #     }

  #     UserLogs.changeset(%UserLogs{}, user_log)
  #     |> Repo.insert()
  #   end)
  #   |> Repo.transaction()
  #   |> case do
  #     {:ok, %{item: _item, user_log: _user_log}} ->
  #       conn
  #       |> put_flash(:info, "New budget has been set successfully")
  #       |> redirect(to: Routes.budget_path(conn, :index))

  #     {:error, _failed_operation, failed_value, _changes_so_far} ->
  #       error = traverse_errors(failed_value.errors)

  #       conn
  #       |> put_flash(:error, "Failed to set budget because " <> error)
  #       |> redirect(to: Routes.budget_path(conn, :index))
  #   end

  #   # rescue
  #   # _ ->
  #   #   conn
  #   #   |> put_flash(:error, "An error occurred, reason unknown. try again")
  #   #   |> redirect(to: Routes.bank_path(conn, :index))
  # end

  defp prep_params(params) do
    bgt_ref = random_string(10)

    %{
      amount: params["amount"],
      from: params["from"],
      to: params["to"],
      status: "OPEN",
      narration: params["narration"],
      user_id: params["user_id"],
      budget_ref: bgt_ref
    }
  end

  def random_string(length) do
    :crypto.strong_rand_bytes(length)
    |> Base.url_encode64()
    |> binary_part(0, length)
  end

  def to_atomic_map(string_map) do
    AtomicMap.convert(string_map, %{safe: false})
  end

  def traverse_errors(errors) do
    errors = for {key, {msg, _opts}} <- errors, do: "#{key} #{msg}"
    List.first(errors)
  end
end
