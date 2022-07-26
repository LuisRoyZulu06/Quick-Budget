defmodule QuickBudget.Repo.Migrations.CreateTblEmailLogs do
  use Ecto.Migration

  def change do
    create table(:tbl_email_logs) do
      add :subject, :string
      add :sender_email, :string
      add :sender_name, :string
      add :mail_body, :string
      add :recipient_email, :string
      add :status, :string
      add :attempts, :string

      timestamps()
    end
  end
end
