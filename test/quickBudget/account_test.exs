defmodule QuickBudget.AccountTest do
  use QuickBudget.DataCase

  alias QuickBudget.Account

  describe "tbl_users" do
    alias QuickBudget.Account.User

    import QuickBudget.AccountFixtures

    @invalid_attrs %{auto_password: nil, "d.o.b": nil, email: nil, first_name: nil, gender: nil, last_name: nil, password: nil, phone: nil, user_status: nil, username: nil}

    test "list_tbl_users/0 returns all tbl_users" do
      user = user_fixture()
      assert Account.list_tbl_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{auto_password: "some auto_password", "d.o.b": "some d.o.b", email: "some email", first_name: "some first_name", gender: "some gender", last_name: "some last_name", password: "some password", phone: "some phone", user_status: "some user_status", username: "some username"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.auto_password == "some auto_password"
      assert user.d.o.b == "some d.o.b"
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.gender == "some gender"
      assert user.last_name == "some last_name"
      assert user.password == "some password"
      assert user.phone == "some phone"
      assert user.user_status == "some user_status"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{auto_password: "some updated auto_password", "d.o.b": "some updated d.o.b", email: "some updated email", first_name: "some updated first_name", gender: "some updated gender", last_name: "some updated last_name", password: "some updated password", phone: "some updated phone", user_status: "some updated user_status", username: "some updated username"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.auto_password == "some updated auto_password"
      assert user.d.o.b == "some updated d.o.b"
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.gender == "some updated gender"
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
      assert user.user_status == "some updated user_status"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
