defmodule QuickBudget.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuickBudget.Account` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        auto_password: "some auto_password",
        d.o.b: "some d.o.b",
        email: "some email",
        first_name: "some first_name",
        gender: "some gender",
        last_name: "some last_name",
        password: "some password",
        phone: "some phone",
        user_status: "some user_status",
        username: "some username"
      })
      |> QuickBudget.Account.create_user()

    user
  end
end
