defmodule QuickBudget.Transfers.BankAccount do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tbl_accounts" do
    field :acc_name, :string
    field :acc_no, :string
    belongs_to :user, QuickBudget.Accounts.UserAccounts, foreign_key: :user_id, type: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transactions, attrs) do
    transactions
    |> cast(attrs, [:acc_name, :acc_no, :user_id])
    |> validate_required([:acc_name, :acc_no, :user_id])
  end
end
