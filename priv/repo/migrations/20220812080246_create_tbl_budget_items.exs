defmodule QuickBudget.Repo.Migrations.CreateTblBudgetItems do
  use Ecto.Migration

  def change do
    create table(:tbl_budget_items) do
      add :budget_category, :string
      add :activity_name, :string
      add :amount_reserved, :string
      add :from, :date
      add :to, :date
      add :details, :string
      add :status, :string
      add :user_id, references(:tbl_users, column: :id, on_delete: :delete_all)
      add :acc_id, references(:tbl_accounts, column: :id, on_delete: :nothing)

      timestamps()
    end
  end
end
