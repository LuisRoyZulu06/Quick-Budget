defmodule QuickBudget.Repo.Migrations.CreateTblBudgetAmount do
  use Ecto.Migration

  def change do
    create table(:tbl_budget_amount) do
      add :amount, :string
      add :from, :string
      add :to, :string
      add :status, :string
      add :user_id, references(:tbl_users, column: :id, on_delete: :nothing)

      timestamps()
    end
  end
end
