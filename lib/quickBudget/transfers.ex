defmodule QuickBudget.Transfers do
  @moduledoc """
  The Transfers context.
  """

  import Ecto.Query, warn: false
  alias QuickBudget.Repo

  alias QuickBudget.Transfers.BankAccount

  @doc """
  Returns the list of tbl_accounts.

  ## Examples

      iex> list_tbl_accounts()
      [%BankAccount{}, ...]

  """
  def list_tbl_accounts do
    Repo.all(BankAccount)
  end

  @doc """
  Gets a single bank_account.

  Raises `Ecto.NoResultsError` if the Bank account does not exist.

  ## Examples

      iex> get_bank_account!(123)
      %BankAccount{}

      iex> get_bank_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bank_account!(id), do: Repo.get!(BankAccount, id)

  def get_acc_details(user_id) do
    BankAccount
    |> where([a], a.user_id == ^user_id)
    # |> select([a], %{acc_no: a.acc_no}) To return account No. only
    |> Repo.one()
  end

  @doc """
  Creates a bank_account.

  ## Examples

      iex> create_bank_account(%{field: value})
      {:ok, %BankAccount{}}

      iex> create_bank_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bank_account(attrs \\ %{}) do
    %BankAccount{}
    |> BankAccount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bank_account.

  ## Examples

      iex> update_bank_account(bank_account, %{field: new_value})
      {:ok, %BankAccount{}}

      iex> update_bank_account(bank_account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bank_account(%BankAccount{} = bank_account, attrs) do
    bank_account
    |> BankAccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bank_account.

  ## Examples

      iex> delete_bank_account(bank_account)
      {:ok, %BankAccount{}}

      iex> delete_bank_account(bank_account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bank_account(%BankAccount{} = bank_account) do
    Repo.delete(bank_account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bank_account changes.

  ## Examples

      iex> change_bank_account(bank_account)
      %Ecto.Changeset{data: %BankAccount{}}

  """
  def change_bank_account(%BankAccount{} = bank_account, attrs \\ %{}) do
    BankAccount.changeset(bank_account, attrs)
  end

  alias QuickBudget.Transfers.Transactions

  @doc """
  Returns the list of tbl_txns.

  ## Examples

      iex> list_tbl_txns()
      [%Transactions{}, ...]

  """
  def list_tbl_txns do
    Repo.all(Transactions)
  end

  @doc """
  Gets a single transactions.

  Raises `Ecto.NoResultsError` if the Transactions does not exist.

  ## Examples

      iex> get_transactions!(123)
      %Transactions{}

      iex> get_transactions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transactions!(id), do: Repo.get!(Transactions, id)

  @doc """
  Creates a transactions.

  ## Examples

      iex> create_transactions(%{field: value})
      {:ok, %Transactions{}}

      iex> create_transactions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transactions(attrs \\ %{}) do
    %Transactions{}
    |> Transactions.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transactions.

  ## Examples

      iex> update_transactions(transactions, %{field: new_value})
      {:ok, %Transactions{}}

      iex> update_transactions(transactions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transactions(%Transactions{} = transactions, attrs) do
    transactions
    |> Transactions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transactions.

  ## Examples

      iex> delete_transactions(transactions)
      {:ok, %Transactions{}}

      iex> delete_transactions(transactions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transactions(%Transactions{} = transactions) do
    Repo.delete(transactions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transactions changes.

  ## Examples

      iex> change_transactions(transactions)
      %Ecto.Changeset{data: %Transactions{}}

  """
  def change_transactions(%Transactions{} = transactions, attrs \\ %{}) do
    Transactions.changeset(transactions, attrs)
  end

  alias QuickBudget.Transfers.BankCredit

  @doc """
  Returns the list of tbl_bank_credit.

  ## Examples

      iex> list_tbl_bank_credit()
      [%BankCredit{}, ...]

  """
  def list_tbl_bank_credit do
    Repo.all(BankCredit)
  end

  @doc """
  Gets a single bank_credit.

  Raises `Ecto.NoResultsError` if the Bank credit does not exist.

  ## Examples

      iex> get_bank_credit!(123)
      %BankCredit{}

      iex> get_bank_credit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bank_credit!(id), do: Repo.get!(BankCredit, id)

  @doc """
  Creates a bank_credit.

  ## Examples

      iex> create_bank_credit(%{field: value})
      {:ok, %BankCredit{}}

      iex> create_bank_credit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bank_credit(attrs \\ %{}) do
    %BankCredit{}
    |> BankCredit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bank_credit.

  ## Examples

      iex> update_bank_credit(bank_credit, %{field: new_value})
      {:ok, %BankCredit{}}

      iex> update_bank_credit(bank_credit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bank_credit(%BankCredit{} = bank_credit, attrs) do
    bank_credit
    |> BankCredit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bank_credit.

  ## Examples

      iex> delete_bank_credit(bank_credit)
      {:ok, %BankCredit{}}

      iex> delete_bank_credit(bank_credit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bank_credit(%BankCredit{} = bank_credit) do
    Repo.delete(bank_credit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bank_credit changes.

  ## Examples

      iex> change_bank_credit(bank_credit)
      %Ecto.Changeset{data: %BankCredit{}}

  """
  def change_bank_credit(%BankCredit{} = bank_credit, attrs \\ %{}) do
    BankCredit.changeset(bank_credit, attrs)
  end
end
