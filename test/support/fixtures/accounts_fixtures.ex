defmodule QuickBudget.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuickBudget.Accounts` context.
  """

  @doc """
  Generate a user_accounts.
  """
  def user_accounts_fixture(attrs \\ %{}) do
    {:ok, user_accounts} =
      attrs
      |> Enum.into(%{
        auto_password: "some auto_password",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        password: "some password",
        phone: "some phone",
        user_status: "some user_status",
        username: "some username"
      })
      |> QuickBudget.Accounts.create_user_accounts()

    user_accounts
  end
end
