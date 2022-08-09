defmodule QuickBudget.Repo.Migrations.CreateTblAccounts do
  use Ecto.Migration

  def change do
    create table(:tbl_accounts) do
      add :acc_name, :string
      add :acc_no, :string
      add :user_id, references(:tbl_users, column: :id, on_delete: :delete_all)
      timestamps()
    end
  end
end
