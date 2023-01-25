defmodule QuickBudget.BudgetTest do
  use QuickBudget.DataCase

  alias QuickBudget.Budget

  describe "tbl_budget_limit" do
    alias QuickBudget.Budget.Budgeting

    import QuickBudget.BudgetFixtures

    @invalid_attrs %{amount: nil, from: nil, status: nil, to: nil, user_id: nil}

    test "list_tbl_budget_limit/0 returns all tbl_budget_limit" do
      budgeting = budgeting_fixture()
      assert Budget.list_tbl_budget_limit() == [budgeting]
    end

    test "get_budgeting!/1 returns the budgeting with given id" do
      budgeting = budgeting_fixture()
      assert Budget.get_budgeting!(budgeting.id) == budgeting
    end

    test "create_budgeting/1 with valid data creates a budgeting" do
      valid_attrs = %{amount: "some amount", from: "some from", status: "some status", to: "some to", user_id: "some user_id"}

      assert {:ok, %Budgeting{} = budgeting} = Budget.create_budgeting(valid_attrs)
      assert budgeting.amount == "some amount"
      assert budgeting.from == "some from"
      assert budgeting.status == "some status"
      assert budgeting.to == "some to"
      assert budgeting.user_id == "some user_id"
    end

    test "create_budgeting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_budgeting(@invalid_attrs)
    end

    test "update_budgeting/2 with valid data updates the budgeting" do
      budgeting = budgeting_fixture()
      update_attrs = %{amount: "some updated amount", from: "some updated from", status: "some updated status", to: "some updated to", user_id: "some updated user_id"}

      assert {:ok, %Budgeting{} = budgeting} = Budget.update_budgeting(budgeting, update_attrs)
      assert budgeting.amount == "some updated amount"
      assert budgeting.from == "some updated from"
      assert budgeting.status == "some updated status"
      assert budgeting.to == "some updated to"
      assert budgeting.user_id == "some updated user_id"
    end

    test "update_budgeting/2 with invalid data returns error changeset" do
      budgeting = budgeting_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_budgeting(budgeting, @invalid_attrs)
      assert budgeting == Budget.get_budgeting!(budgeting.id)
    end

    test "delete_budgeting/1 deletes the budgeting" do
      budgeting = budgeting_fixture()
      assert {:ok, %Budgeting{}} = Budget.delete_budgeting(budgeting)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_budgeting!(budgeting.id) end
    end

    test "change_budgeting/1 returns a budgeting changeset" do
      budgeting = budgeting_fixture()
      assert %Ecto.Changeset{} = Budget.change_budgeting(budgeting)
    end
  end

  describe "tbl_budget_items" do
    alias QuickBudget.Budget.Budgeting

    import QuickBudget.BudgetFixtures

    @invalid_attrs %{amount_reserved: nil, budget_category: nil, budget_item: nil, details: nil, status: nil, user_id: nil}

    test "list_tbl_budget_items/0 returns all tbl_budget_items" do
      budgeting = budgeting_fixture()
      assert Budget.list_tbl_budget_items() == [budgeting]
    end

    test "get_budgeting!/1 returns the budgeting with given id" do
      budgeting = budgeting_fixture()
      assert Budget.get_budgeting!(budgeting.id) == budgeting
    end

    test "create_budgeting/1 with valid data creates a budgeting" do
      valid_attrs = %{amount_reserved: "some amount_reserved", budget_category: "some budget_category", budget_item: "some budget_item", details: "some details", status: "some status", user_id: "some user_id"}

      assert {:ok, %Budgeting{} = budgeting} = Budget.create_budgeting(valid_attrs)
      assert budgeting.amount_reserved == "some amount_reserved"
      assert budgeting.budget_category == "some budget_category"
      assert budgeting.budget_item == "some budget_item"
      assert budgeting.details == "some details"
      assert budgeting.status == "some status"
      assert budgeting.user_id == "some user_id"
    end

    test "create_budgeting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_budgeting(@invalid_attrs)
    end

    test "update_budgeting/2 with valid data updates the budgeting" do
      budgeting = budgeting_fixture()
      update_attrs = %{amount_reserved: "some updated amount_reserved", budget_category: "some updated budget_category", budget_item: "some updated budget_item", details: "some updated details", status: "some updated status", user_id: "some updated user_id"}

      assert {:ok, %Budgeting{} = budgeting} = Budget.update_budgeting(budgeting, update_attrs)
      assert budgeting.amount_reserved == "some updated amount_reserved"
      assert budgeting.budget_category == "some updated budget_category"
      assert budgeting.budget_item == "some updated budget_item"
      assert budgeting.details == "some updated details"
      assert budgeting.status == "some updated status"
      assert budgeting.user_id == "some updated user_id"
    end

    test "update_budgeting/2 with invalid data returns error changeset" do
      budgeting = budgeting_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_budgeting(budgeting, @invalid_attrs)
      assert budgeting == Budget.get_budgeting!(budgeting.id)
    end

    test "delete_budgeting/1 deletes the budgeting" do
      budgeting = budgeting_fixture()
      assert {:ok, %Budgeting{}} = Budget.delete_budgeting(budgeting)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_budgeting!(budgeting.id) end
    end

    test "change_budgeting/1 returns a budgeting changeset" do
      budgeting = budgeting_fixture()
      assert %Ecto.Changeset{} = Budget.change_budgeting(budgeting)
    end
  end

  describe "tbl_budget_items" do
    alias QuickBudget.Budget.BudgetItems

    import QuickBudget.BudgetFixtures

    @invalid_attrs %{amount_reserved: nil, budget_category: nil, budget_item: nil, details: nil, status: nil, user_id: nil}

    test "list_tbl_budget_items/0 returns all tbl_budget_items" do
      budget_items = budget_items_fixture()
      assert Budget.list_tbl_budget_items() == [budget_items]
    end

    test "get_budget_items!/1 returns the budget_items with given id" do
      budget_items = budget_items_fixture()
      assert Budget.get_budget_items!(budget_items.id) == budget_items
    end

    test "create_budget_items/1 with valid data creates a budget_items" do
      valid_attrs = %{amount_reserved: "some amount_reserved", budget_category: "some budget_category", budget_item: "some budget_item", details: "some details", status: "some status", user_id: "some user_id"}

      assert {:ok, %BudgetItems{} = budget_items} = Budget.create_budget_items(valid_attrs)
      assert budget_items.amount_reserved == "some amount_reserved"
      assert budget_items.budget_category == "some budget_category"
      assert budget_items.budget_item == "some budget_item"
      assert budget_items.details == "some details"
      assert budget_items.status == "some status"
      assert budget_items.user_id == "some user_id"
    end

    test "create_budget_items/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_budget_items(@invalid_attrs)
    end

    test "update_budget_items/2 with valid data updates the budget_items" do
      budget_items = budget_items_fixture()
      update_attrs = %{amount_reserved: "some updated amount_reserved", budget_category: "some updated budget_category", budget_item: "some updated budget_item", details: "some updated details", status: "some updated status", user_id: "some updated user_id"}

      assert {:ok, %BudgetItems{} = budget_items} = Budget.update_budget_items(budget_items, update_attrs)
      assert budget_items.amount_reserved == "some updated amount_reserved"
      assert budget_items.budget_category == "some updated budget_category"
      assert budget_items.budget_item == "some updated budget_item"
      assert budget_items.details == "some updated details"
      assert budget_items.status == "some updated status"
      assert budget_items.user_id == "some updated user_id"
    end

    test "update_budget_items/2 with invalid data returns error changeset" do
      budget_items = budget_items_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_budget_items(budget_items, @invalid_attrs)
      assert budget_items == Budget.get_budget_items!(budget_items.id)
    end

    test "delete_budget_items/1 deletes the budget_items" do
      budget_items = budget_items_fixture()
      assert {:ok, %BudgetItems{}} = Budget.delete_budget_items(budget_items)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_budget_items!(budget_items.id) end
    end

    test "change_budget_items/1 returns a budget_items changeset" do
      budget_items = budget_items_fixture()
      assert %Ecto.Changeset{} = Budget.change_budget_items(budget_items)
    end
  end

  describe "tbl_budget_amount" do
    alias QuickBudget.Budget.BudgetAmount

    import QuickBudget.BudgetFixtures

    @invalid_attrs %{amount: nil, from: nil, status: nil, to: nil, user_id: nil}

    test "list_tbl_budget_amount/0 returns all tbl_budget_amount" do
      budget_amount = budget_amount_fixture()
      assert Budget.list_tbl_budget_amount() == [budget_amount]
    end

    test "get_budget_amount!/1 returns the budget_amount with given id" do
      budget_amount = budget_amount_fixture()
      assert Budget.get_budget_amount!(budget_amount.id) == budget_amount
    end

    test "create_budget_amount/1 with valid data creates a budget_amount" do
      valid_attrs = %{amount: "some amount", from: "some from", status: "some status", to: "some to", user_id: "some user_id"}

      assert {:ok, %BudgetAmount{} = budget_amount} = Budget.create_budget_amount(valid_attrs)
      assert budget_amount.amount == "some amount"
      assert budget_amount.from == "some from"
      assert budget_amount.status == "some status"
      assert budget_amount.to == "some to"
      assert budget_amount.user_id == "some user_id"
    end

    test "create_budget_amount/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_budget_amount(@invalid_attrs)
    end

    test "update_budget_amount/2 with valid data updates the budget_amount" do
      budget_amount = budget_amount_fixture()
      update_attrs = %{amount: "some updated amount", from: "some updated from", status: "some updated status", to: "some updated to", user_id: "some updated user_id"}

      assert {:ok, %BudgetAmount{} = budget_amount} = Budget.update_budget_amount(budget_amount, update_attrs)
      assert budget_amount.amount == "some updated amount"
      assert budget_amount.from == "some updated from"
      assert budget_amount.status == "some updated status"
      assert budget_amount.to == "some updated to"
      assert budget_amount.user_id == "some updated user_id"
    end

    test "update_budget_amount/2 with invalid data returns error changeset" do
      budget_amount = budget_amount_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_budget_amount(budget_amount, @invalid_attrs)
      assert budget_amount == Budget.get_budget_amount!(budget_amount.id)
    end

    test "delete_budget_amount/1 deletes the budget_amount" do
      budget_amount = budget_amount_fixture()
      assert {:ok, %BudgetAmount{}} = Budget.delete_budget_amount(budget_amount)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_budget_amount!(budget_amount.id) end
    end

    test "change_budget_amount/1 returns a budget_amount changeset" do
      budget_amount = budget_amount_fixture()
      assert %Ecto.Changeset{} = Budget.change_budget_amount(budget_amount)
    end
  end

  describe "tbl_budget_items" do
    alias QuickBudget.Budget.BudgetItems

    import QuickBudget.BudgetFixtures

    @invalid_attrs %{amount_reserved: nil, budget_category: nil, budget_id: nil, budget_item: nil, details: nil, status: nil}

    test "list_tbl_budget_items/0 returns all tbl_budget_items" do
      budget_items = budget_items_fixture()
      assert Budget.list_tbl_budget_items() == [budget_items]
    end

    test "get_budget_items!/1 returns the budget_items with given id" do
      budget_items = budget_items_fixture()
      assert Budget.get_budget_items!(budget_items.id) == budget_items
    end

    test "create_budget_items/1 with valid data creates a budget_items" do
      valid_attrs = %{amount_reserved: "some amount_reserved", budget_category: "some budget_category", budget_id: "some budget_id", budget_item: "some budget_item", details: "some details", status: "some status"}

      assert {:ok, %BudgetItems{} = budget_items} = Budget.create_budget_items(valid_attrs)
      assert budget_items.amount_reserved == "some amount_reserved"
      assert budget_items.budget_category == "some budget_category"
      assert budget_items.budget_id == "some budget_id"
      assert budget_items.budget_item == "some budget_item"
      assert budget_items.details == "some details"
      assert budget_items.status == "some status"
    end

    test "create_budget_items/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_budget_items(@invalid_attrs)
    end

    test "update_budget_items/2 with valid data updates the budget_items" do
      budget_items = budget_items_fixture()
      update_attrs = %{amount_reserved: "some updated amount_reserved", budget_category: "some updated budget_category", budget_id: "some updated budget_id", budget_item: "some updated budget_item", details: "some updated details", status: "some updated status"}

      assert {:ok, %BudgetItems{} = budget_items} = Budget.update_budget_items(budget_items, update_attrs)
      assert budget_items.amount_reserved == "some updated amount_reserved"
      assert budget_items.budget_category == "some updated budget_category"
      assert budget_items.budget_id == "some updated budget_id"
      assert budget_items.budget_item == "some updated budget_item"
      assert budget_items.details == "some updated details"
      assert budget_items.status == "some updated status"
    end

    test "update_budget_items/2 with invalid data returns error changeset" do
      budget_items = budget_items_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_budget_items(budget_items, @invalid_attrs)
      assert budget_items == Budget.get_budget_items!(budget_items.id)
    end

    test "delete_budget_items/1 deletes the budget_items" do
      budget_items = budget_items_fixture()
      assert {:ok, %BudgetItems{}} = Budget.delete_budget_items(budget_items)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_budget_items!(budget_items.id) end
    end

    test "change_budget_items/1 returns a budget_items changeset" do
      budget_items = budget_items_fixture()
      assert %Ecto.Changeset{} = Budget.change_budget_items(budget_items)
    end
  end
end
