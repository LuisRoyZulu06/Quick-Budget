defmodule QuickBudget.TransfersTest do
  use QuickBudget.DataCase

  alias QuickBudget.Transfers

  describe "tbl_accounts" do
    alias QuickBudget.Transfers.BankAccount

    import QuickBudget.TransfersFixtures

    @invalid_attrs %{acc_name: nil, acc_no: nil, amount: nil, narration: nil, txn_reference: nil, txn_type: nil}

    test "list_tbl_accounts/0 returns all tbl_accounts" do
      bank_account = bank_account_fixture()
      assert Transfers.list_tbl_accounts() == [bank_account]
    end

    test "get_bank_account!/1 returns the bank_account with given id" do
      bank_account = bank_account_fixture()
      assert Transfers.get_bank_account!(bank_account.id) == bank_account
    end

    test "create_bank_account/1 with valid data creates a bank_account" do
      valid_attrs = %{acc_name: "some acc_name", acc_no: "some acc_no", amount: "some amount", narration: "some narration", txn_reference: "some txn_reference", txn_type: "some txn_type"}

      assert {:ok, %BankAccount{} = bank_account} = Transfers.create_bank_account(valid_attrs)
      assert bank_account.acc_name == "some acc_name"
      assert bank_account.acc_no == "some acc_no"
      assert bank_account.amount == "some amount"
      assert bank_account.narration == "some narration"
      assert bank_account.txn_reference == "some txn_reference"
      assert bank_account.txn_type == "some txn_type"
    end

    test "create_bank_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transfers.create_bank_account(@invalid_attrs)
    end

    test "update_bank_account/2 with valid data updates the bank_account" do
      bank_account = bank_account_fixture()
      update_attrs = %{acc_name: "some updated acc_name", acc_no: "some updated acc_no", amount: "some updated amount", narration: "some updated narration", txn_reference: "some updated txn_reference", txn_type: "some updated txn_type"}

      assert {:ok, %BankAccount{} = bank_account} = Transfers.update_bank_account(bank_account, update_attrs)
      assert bank_account.acc_name == "some updated acc_name"
      assert bank_account.acc_no == "some updated acc_no"
      assert bank_account.amount == "some updated amount"
      assert bank_account.narration == "some updated narration"
      assert bank_account.txn_reference == "some updated txn_reference"
      assert bank_account.txn_type == "some updated txn_type"
    end

    test "update_bank_account/2 with invalid data returns error changeset" do
      bank_account = bank_account_fixture()
      assert {:error, %Ecto.Changeset{}} = Transfers.update_bank_account(bank_account, @invalid_attrs)
      assert bank_account == Transfers.get_bank_account!(bank_account.id)
    end

    test "delete_bank_account/1 deletes the bank_account" do
      bank_account = bank_account_fixture()
      assert {:ok, %BankAccount{}} = Transfers.delete_bank_account(bank_account)
      assert_raise Ecto.NoResultsError, fn -> Transfers.get_bank_account!(bank_account.id) end
    end

    test "change_bank_account/1 returns a bank_account changeset" do
      bank_account = bank_account_fixture()
      assert %Ecto.Changeset{} = Transfers.change_bank_account(bank_account)
    end
  end

  describe "tbl_txns" do
    alias QuickBudget.Transfers.Transactions

    import QuickBudget.TransfersFixtures

    @invalid_attrs %{acc_name: nil, acc_no: nil, user_id: nil}

    test "list_tbl_txns/0 returns all tbl_txns" do
      transactions = transactions_fixture()
      assert Transfers.list_tbl_txns() == [transactions]
    end

    test "get_transactions!/1 returns the transactions with given id" do
      transactions = transactions_fixture()
      assert Transfers.get_transactions!(transactions.id) == transactions
    end

    test "create_transactions/1 with valid data creates a transactions" do
      valid_attrs = %{acc_name: "some acc_name", acc_no: "some acc_no", user_id: "some user_id"}

      assert {:ok, %Transactions{} = transactions} = Transfers.create_transactions(valid_attrs)
      assert transactions.acc_name == "some acc_name"
      assert transactions.acc_no == "some acc_no"
      assert transactions.user_id == "some user_id"
    end

    test "create_transactions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transfers.create_transactions(@invalid_attrs)
    end

    test "update_transactions/2 with valid data updates the transactions" do
      transactions = transactions_fixture()
      update_attrs = %{acc_name: "some updated acc_name", acc_no: "some updated acc_no", user_id: "some updated user_id"}

      assert {:ok, %Transactions{} = transactions} = Transfers.update_transactions(transactions, update_attrs)
      assert transactions.acc_name == "some updated acc_name"
      assert transactions.acc_no == "some updated acc_no"
      assert transactions.user_id == "some updated user_id"
    end

    test "update_transactions/2 with invalid data returns error changeset" do
      transactions = transactions_fixture()
      assert {:error, %Ecto.Changeset{}} = Transfers.update_transactions(transactions, @invalid_attrs)
      assert transactions == Transfers.get_transactions!(transactions.id)
    end

    test "delete_transactions/1 deletes the transactions" do
      transactions = transactions_fixture()
      assert {:ok, %Transactions{}} = Transfers.delete_transactions(transactions)
      assert_raise Ecto.NoResultsError, fn -> Transfers.get_transactions!(transactions.id) end
    end

    test "change_transactions/1 returns a transactions changeset" do
      transactions = transactions_fixture()
      assert %Ecto.Changeset{} = Transfers.change_transactions(transactions)
    end
  end

  describe "tbl_bank_credit" do
    alias QuickBudget.Transfers.BankCredit

    import QuickBudget.TransfersFixtures

    @invalid_attrs %{acc_id: nil, acc_no: nil, amount: nil}

    test "list_tbl_bank_credit/0 returns all tbl_bank_credit" do
      bank_credit = bank_credit_fixture()
      assert Transfers.list_tbl_bank_credit() == [bank_credit]
    end

    test "get_bank_credit!/1 returns the bank_credit with given id" do
      bank_credit = bank_credit_fixture()
      assert Transfers.get_bank_credit!(bank_credit.id) == bank_credit
    end

    test "create_bank_credit/1 with valid data creates a bank_credit" do
      valid_attrs = %{acc_id: "some acc_id", acc_no: "some acc_no", amount: "some amount"}

      assert {:ok, %BankCredit{} = bank_credit} = Transfers.create_bank_credit(valid_attrs)
      assert bank_credit.acc_id == "some acc_id"
      assert bank_credit.acc_no == "some acc_no"
      assert bank_credit.amount == "some amount"
    end

    test "create_bank_credit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transfers.create_bank_credit(@invalid_attrs)
    end

    test "update_bank_credit/2 with valid data updates the bank_credit" do
      bank_credit = bank_credit_fixture()
      update_attrs = %{acc_id: "some updated acc_id", acc_no: "some updated acc_no", amount: "some updated amount"}

      assert {:ok, %BankCredit{} = bank_credit} = Transfers.update_bank_credit(bank_credit, update_attrs)
      assert bank_credit.acc_id == "some updated acc_id"
      assert bank_credit.acc_no == "some updated acc_no"
      assert bank_credit.amount == "some updated amount"
    end

    test "update_bank_credit/2 with invalid data returns error changeset" do
      bank_credit = bank_credit_fixture()
      assert {:error, %Ecto.Changeset{}} = Transfers.update_bank_credit(bank_credit, @invalid_attrs)
      assert bank_credit == Transfers.get_bank_credit!(bank_credit.id)
    end

    test "delete_bank_credit/1 deletes the bank_credit" do
      bank_credit = bank_credit_fixture()
      assert {:ok, %BankCredit{}} = Transfers.delete_bank_credit(bank_credit)
      assert_raise Ecto.NoResultsError, fn -> Transfers.get_bank_credit!(bank_credit.id) end
    end

    test "change_bank_credit/1 returns a bank_credit changeset" do
      bank_credit = bank_credit_fixture()
      assert %Ecto.Changeset{} = Transfers.change_bank_credit(bank_credit)
    end
  end
end
