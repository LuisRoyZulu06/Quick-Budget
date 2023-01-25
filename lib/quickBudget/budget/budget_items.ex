defmodule QuickBudget.Budget.BudgetItems do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w(amount_reserved budget_category budget_item details status budget_id)a
  @required_fields ~w(amount_reserved budget_category budget_item details status budget_id)a

  schema "tbl_budget_items" do
    field :amount_reserved, :string
    field :budget_category, :string
    field :budget_item, :string
    field :details, :string
    field :status, :string

    belongs_to :tbl_budget_amount, QuickBudget.Budget.Budgeting, foreign_key: :budget_id, type: :id

    timestamps()
  end

  @doc false
  def changeset(budget_items, attrs) do
    budget_items
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
