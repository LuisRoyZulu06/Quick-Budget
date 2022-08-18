defmodule QuickBudget.Transfers.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tbl_budget_items" do
    field :activity_name, :string
    field :amount_reserved, :string
    field :budget_category, :string
    field :details, :string
    field :from, :date
    field :status, :string
    field :to, :date
    belongs_to :user, QuickBudget.Accounts.UserAccounts, foreign_key: :user_id, type: :id
    belongs_to :accounts, QuickBudget.Transfers.BankAccount, foreign_key: :acc_id, type: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [
      :budget_category,
      :activity_name,
      :amount_reserved,
      :from,
      :to,
      :details,
      :status,
      :user_id,
      :acc_id
    ])
    |> validate_required([
      :budget_category,
      :activity_name,
      :amount_reserved,
      :from,
      :to,
      :details,
      :status,
      :user_id,
      :acc_id
    ])
  end
end
