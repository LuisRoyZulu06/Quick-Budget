defmodule QuickBudget.Budget.BudgetAmount do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w(amount from status to user_id)a
  @required_fields ~w(amount from status to user_id)a

  schema "tbl_budget_amount" do
    field :amount, :string
    field :from, :string
    field :status, :string
    field :to, :string
    belongs_to :tbl_users, QuickBudget.Budget.Budgeting, foreign_key: :user_id, type: :id

    timestamps()
  end
  @doc false
  def changeset(budget_amount, attrs) do
    budget_amount
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
