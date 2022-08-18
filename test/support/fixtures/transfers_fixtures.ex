defmodule QuickBudget.TransfersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuickBudget.Transfers` context.
  """

  @doc """
  Generate a bank_account.
  """
  def bank_account_fixture(attrs \\ %{}) do
    {:ok, bank_account} =
      attrs
      |> Enum.into(%{
        acc_name: "some acc_name",
        acc_no: "some acc_no",
        amount: "some amount",
        narration: "some narration",
        txn_reference: "some txn_reference",
        txn_type: "some txn_type"
      })
      |> QuickBudget.Transfers.create_bank_account()

    bank_account
  end

  @doc """
  Generate a transactions.
  """
  def transactions_fixture(attrs \\ %{}) do
    {:ok, transactions} =
      attrs
      |> Enum.into(%{
        acc_name: "some acc_name",
        acc_no: "some acc_no",
        user_id: "some user_id"
      })
      |> QuickBudget.Transfers.create_transactions()

    transactions
  end

  @doc """
  Generate a bank_credit.
  """
  def bank_credit_fixture(attrs \\ %{}) do
    {:ok, bank_credit} =
      attrs
      |> Enum.into(%{
        acc_id: "some acc_id",
        acc_no: "some acc_no",
        amount: "some amount"
      })
      |> QuickBudget.Transfers.create_bank_credit()

    bank_credit
  end

  @doc """
  Generate a transactions.
  """
  def transactions_fixture(attrs \\ %{}) do
    {:ok, transactions} =
      attrs
      |> Enum.into(%{
        acc_id: "some acc_id",
        activity_name: "some activity_name",
        amount_reserved: "some amount_reserved",
        budget_category: "some budget_category",
        details: "some details",
        from: "some from",
        status: "some status",
        to: "some to",
        user_id: "some user_id"
      })
      |> QuickBudget.Transfers.create_transactions()

    transactions
  end

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> Enum.into(%{
        acc_id: "some acc_id",
        activity_name: "some activity_name",
        amount_reserved: "some amount_reserved",
        budget_category: "some budget_category",
        details: "some details",
        from: "some from",
        status: "some status",
        to: "some to",
        user_id: "some user_id"
      })
      |> QuickBudget.Transfers.create_budget()

    budget
  end
end
