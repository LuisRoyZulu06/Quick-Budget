defmodule QuickBudget.Transfers.BankCredit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tbl_bank_credit" do
    field :acc_no, :string
    field :amount, :string
    belongs_to :accounts, QuickBudget.Transfers.BankAccount, foreign_key: :acc_id, type: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bank_credit, attrs) do
    bank_credit
    |> cast(attrs, [:acc_no, :acc_id, :amount])
    |> validate_required([:acc_no, :acc_id, :amount])
  end
end
