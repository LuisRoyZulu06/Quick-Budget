defmodule QuickBudgetWeb.Plugs.SetClient do
  @behaviour Plug
  import Plug.Conn

  alias QuickBudget.Accounts
  alias QuickBudget.Transfers

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :current_user)

    cond do
      user = user_id && Accounts.get_user_account!(user_id) ->
        assign(conn, :user, user)

      true ->
        assign(conn, :user, nil)
    end
  end

  # def client_dits(conn, _params) do
  #   user = conn.assigns.user

  #   cond do
  #     acc_details = Transfers.get_acc_details(user.id) ->
  #       assign(conn, :acc_details, acc_details)

  #       true ->
  #         assign(conn, :acc_details, nil)
  #   end
  # end
end
