defmodule QuickBudget.Repo.Migrations.CreateTblUsers do
  use Ecto.Migration

  def change do
    create table(:tbl_users) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :email, :string
      add :phone, :string
      add :password, :string
      add :auto_password, :string
      add :user_status, :string
      add :user_type, :string

      timestamps()
    end
  end
end
