defmodule QuickBudget.Repo.Migrations.CreateTblBankCredit do
  use Ecto.Migration

  def change do
    create table(:tbl_bank_credit) do
      add :acc_no, :string
      add :amount, :string
      add :acc_id, references(:tbl_accounts, column: :id, on_delete: :delete_all)

      timestamps()
    end
  end
end
