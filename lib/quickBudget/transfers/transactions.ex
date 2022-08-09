defmodule QuickBudget.Transfers.Transactions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tbl_txns" do
    field :amount, :string
    field :narration, :string
    field :txn_reference, :string
    field :txn_type, :string
    belongs_to :accounts, QuickBudget.Transfers.BankAccount, foreign_key: :acc_id, type: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bank_account, attrs) do
    bank_account
    |> cast(attrs, [:amount, :narration, :txn_reference, :txn_type, :acc_id])
    |> validate_required([:amount, :narration, :txn_reference, :txn_type, :acc_id])
  end
end
