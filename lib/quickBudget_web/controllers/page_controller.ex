defmodule QuickBudgetWeb.PageController do
  use QuickBudgetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
