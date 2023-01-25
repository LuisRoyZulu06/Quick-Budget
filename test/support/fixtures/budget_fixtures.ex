defmodule QuickBudget.BudgetFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuickBudget.Budget` context.
  """

  @doc """
  Generate a budgeting.
  """
  def budgeting_fixture(attrs \\ %{}) do
    {:ok, budgeting} =
      attrs
      |> Enum.into(%{
        amount: "some amount",
        from: "some from",
        status: "some status",
        to: "some to",
        user_id: "some user_id"
      })
      |> QuickBudget.Budget.create_budgeting()

    budgeting
  end

  @doc """
  Generate a budgeting.
  """
  def budgeting_fixture(attrs \\ %{}) do
    {:ok, budgeting} =
      attrs
      |> Enum.into(%{
        amount_reserved: "some amount_reserved",
        budget_category: "some budget_category",
        budget_item: "some budget_item",
        details: "some details",
        status: "some status",
        user_id: "some user_id"
      })
      |> QuickBudget.Budget.create_budgeting()

    budgeting
  end

  @doc """
  Generate a budget_items.
  """
  def budget_items_fixture(attrs \\ %{}) do
    {:ok, budget_items} =
      attrs
      |> Enum.into(%{
        amount_reserved: "some amount_reserved",
        budget_category: "some budget_category",
        budget_item: "some budget_item",
        details: "some details",
        status: "some status",
        user_id: "some user_id"
      })
      |> QuickBudget.Budget.create_budget_items()

    budget_items
  end

  @doc """
  Generate a budget_amount.
  """
  def budget_amount_fixture(attrs \\ %{}) do
    {:ok, budget_amount} =
      attrs
      |> Enum.into(%{
        amount: "some amount",
        from: "some from",
        status: "some status",
        to: "some to",
        user_id: "some user_id"
      })
      |> QuickBudget.Budget.create_budget_amount()

    budget_amount
  end

  @doc """
  Generate a budget_items.
  """
  def budget_items_fixture(attrs \\ %{}) do
    {:ok, budget_items} =
      attrs
      |> Enum.into(%{
        amount_reserved: "some amount_reserved",
        budget_category: "some budget_category",
        budget_id: "some budget_id",
        budget_item: "some budget_item",
        details: "some details",
        status: "some status"
      })
      |> QuickBudget.Budget.create_budget_items()

    budget_items
  end
end
