defmodule QuickBudget.Repo.Migrations.CreateTblBudgetItems do
  use Ecto.Migration

  def change do
    create table(:tbl_budget_items) do
      add :budget_category, :string
      add :budget_item, :string
      add :amount_reserved, :string
      add :details, :string
      add :status, :string
      add :budget_id, references(:tbl_budget_amount, column: :id, on_delete: :nothing)

      timestamps()
    end
  end
end
