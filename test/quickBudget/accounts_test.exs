defmodule QuickBudget.AccountsTest do
  use QuickBudget.DataCase

  alias QuickBudget.Accounts

  describe "tbl_users" do
    alias QuickBudget.Accounts.UserAccounts

    import QuickBudget.AccountsFixtures

    @invalid_attrs %{auto_password: nil, email: nil, first_name: nil, last_name: nil, password: nil, phone: nil, user_status: nil, username: nil}

    test "list_tbl_users/0 returns all tbl_users" do
      user_accounts = user_accounts_fixture()
      assert Accounts.list_tbl_users() == [user_accounts]
    end

    test "get_user_accounts!/1 returns the user_accounts with given id" do
      user_accounts = user_accounts_fixture()
      assert Accounts.get_user_accounts!(user_accounts.id) == user_accounts
    end

    test "create_user_accounts/1 with valid data creates a user_accounts" do
      valid_attrs = %{auto_password: "some auto_password", email: "some email", first_name: "some first_name", last_name: "some last_name", password: "some password", phone: "some phone", user_status: "some user_status", username: "some username"}

      assert {:ok, %UserAccounts{} = user_accounts} = Accounts.create_user_accounts(valid_attrs)
      assert user_accounts.auto_password == "some auto_password"
      assert user_accounts.email == "some email"
      assert user_accounts.first_name == "some first_name"
      assert user_accounts.last_name == "some last_name"
      assert user_accounts.password == "some password"
      assert user_accounts.phone == "some phone"
      assert user_accounts.user_status == "some user_status"
      assert user_accounts.username == "some username"
    end

    test "create_user_accounts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_accounts(@invalid_attrs)
    end

    test "update_user_accounts/2 with valid data updates the user_accounts" do
      user_accounts = user_accounts_fixture()
      update_attrs = %{auto_password: "some updated auto_password", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password: "some updated password", phone: "some updated phone", user_status: "some updated user_status", username: "some updated username"}

      assert {:ok, %UserAccounts{} = user_accounts} = Accounts.update_user_accounts(user_accounts, update_attrs)
      assert user_accounts.auto_password == "some updated auto_password"
      assert user_accounts.email == "some updated email"
      assert user_accounts.first_name == "some updated first_name"
      assert user_accounts.last_name == "some updated last_name"
      assert user_accounts.password == "some updated password"
      assert user_accounts.phone == "some updated phone"
      assert user_accounts.user_status == "some updated user_status"
      assert user_accounts.username == "some updated username"
    end

    test "update_user_accounts/2 with invalid data returns error changeset" do
      user_accounts = user_accounts_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_accounts(user_accounts, @invalid_attrs)
      assert user_accounts == Accounts.get_user_accounts!(user_accounts.id)
    end

    test "delete_user_accounts/1 deletes the user_accounts" do
      user_accounts = user_accounts_fixture()
      assert {:ok, %UserAccounts{}} = Accounts.delete_user_accounts(user_accounts)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_accounts!(user_accounts.id) end
    end

    test "change_user_accounts/1 returns a user_accounts changeset" do
      user_accounts = user_accounts_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_accounts(user_accounts)
    end
  end
end
