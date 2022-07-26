defmodule QuickBudget.Repo do
  use Ecto.Repo,
    otp_app: :quickBudget,
    adapter: Ecto.Adapters.Postgres
end
