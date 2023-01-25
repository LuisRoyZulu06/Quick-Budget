defmodule QuickBudget.Budget do
  @moduledoc """
  The Budget context.
  """

  import Ecto.Query, warn: false
  alias QuickBudget.Repo

  alias QuickBudget.Budget.BudgetAmount

  @doc """
  Returns the list of tbl_budget_amount.

  ## Examples

      iex> list_tbl_budget_amount()
      [%BudgetAmount{}, ...]

  """
  def list_tbl_budget_amount do
    Repo.all(BudgetAmount)
  end

  @doc """
  Gets a single budget_amount.

  Raises `Ecto.NoResultsError` if the Budget amount does not exist.

  ## Examples

      iex> get_budget_amount!(123)
      %BudgetAmount{}

      iex> get_budget_amount!(456)
      ** (Ecto.NoResultsError)

  """
  def get_budget_amount!(id), do: Repo.get!(BudgetAmount, id)

  @doc """
  Creates a budget_amount.

  ## Examples

      iex> create_budget_amount(%{field: value})
      {:ok, %BudgetAmount{}}

      iex> create_budget_amount(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_budget_amount(attrs \\ %{}) do
    %BudgetAmount{}
    |> BudgetAmount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a budget_amount.

  ## Examples

      iex> update_budget_amount(budget_amount, %{field: new_value})
      {:ok, %BudgetAmount{}}

      iex> update_budget_amount(budget_amount, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_budget_amount(%BudgetAmount{} = budget_amount, attrs) do
    budget_amount
    |> BudgetAmount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a budget_amount.

  ## Examples

      iex> delete_budget_amount(budget_amount)
      {:ok, %BudgetAmount{}}

      iex> delete_budget_amount(budget_amount)
      {:error, %Ecto.Changeset{}}

  """
  def delete_budget_amount(%BudgetAmount{} = budget_amount) do
    Repo.delete(budget_amount)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking budget_amount changes.

  ## Examples

      iex> change_budget_amount(budget_amount)
      %Ecto.Changeset{data: %BudgetAmount{}}

  """
  def change_budget_amount(%BudgetAmount{} = budget_amount, attrs \\ %{}) do
    BudgetAmount.changeset(budget_amount, attrs)
  end

  ## ==================== BUDGET ITEMS
  alias QuickBudget.Budget.BudgetItems

  @doc """
  Returns the list of tbl_budget_items.

  ## Examples

      iex> list_tbl_budget_items()
      [%BudgetItems{}, ...]

  """
  def budget_items do
    Repo.all(BudgetItems)
  end

  @doc """
  Gets a single budget_items.

  Raises `Ecto.NoResultsError` if the Budget items does not exist.

  ## Examples

      iex> get_budget_items!(123)
      %BudgetItems{}

      iex> get_budget_items!(456)
      ** (Ecto.NoResultsError)

  """
  def user_budget_items!(id), do: Repo.get!(BudgetItems, id)

  @doc """
  Creates a budget_items.

  ## Examples

      iex> create_budget_items(%{field: value})
      {:ok, %BudgetItems{}}

      iex> create_budget_items(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_budget_items(attrs \\ %{}) do
    %BudgetItems{}
    |> BudgetItems.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a budget_items.

  ## Examples

      iex> update_budget_items(budget_items, %{field: new_value})
      {:ok, %BudgetItems{}}

      iex> update_budget_items(budget_items, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_budget_items(%BudgetItems{} = budget_items, attrs) do
    budget_items
    |> BudgetItems.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a budget_items.

  ## Examples

      iex> delete_budget_items(budget_items)
      {:ok, %BudgetItems{}}

      iex> delete_budget_items(budget_items)
      {:error, %Ecto.Changeset{}}

  """
  def delete_budget_items(%BudgetItems{} = budget_items) do
    Repo.delete(budget_items)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking budget_items changes.

  ## Examples

      iex> change_budget_items(budget_items)
      %Ecto.Changeset{data: %BudgetItems{}}

  """
  def change_budget_items(%BudgetItems{} = budget_items, attrs \\ %{}) do
    BudgetItems.changeset(budget_items, attrs)
  end
end
