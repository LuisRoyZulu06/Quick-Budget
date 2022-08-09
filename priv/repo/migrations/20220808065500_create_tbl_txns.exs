defmodule QuickBudget.Repo.Migrations.CreateTblTxns do
  use Ecto.Migration

  def change do
    create table(:tbl_txns) do
      add :amount, :string
      add :narration, :string
      add :txn_reference, :string
      add :txn_type, :string
      add :acc_id, references(:tbl_accounts, column: :id, on_delete: :delete_all)

      timestamps()
    end
  end
end
