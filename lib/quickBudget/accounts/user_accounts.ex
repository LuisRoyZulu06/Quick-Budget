defmodule QuickBudget.Accounts.UserAccounts do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w(id first_name last_name username email user_type user_status password auto_password phone)a
  @required_fields ~w(first_name last_name username email user_type user_status password auto_password phone)a

  schema "tbl_users" do
    field :auto_password, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :password, :string
    field :phone, :string
    field :user_status, :string
    field :user_type, :string

    timestamps()
  end

  @doc false
  def changeset(user_accounts, attrs) do
    user_accounts
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:username, name: :unique_username, message: "Username already in use")
    |> put_pass_hash
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    Ecto.Changeset.put_change(changeset, :password, encrypt_password(password))
  end

  defp put_pass_hash(changeset), do: changeset

  def encrypt_password(password), do: Base.encode16(:crypto.hash(:sha512, password))
end

# QuickBudget.Accounts.create_user_accounts(%{first_name: "Luis Roy", last_name: "Zulu", username: "Luis", email: "luis@probasegroup.com", password: "password06", auto_pwd: "N", user_type: "BACKOFFICE", user_status: "ACTIVE", phone: "+260977551290",inserted_at: NaiveDateTime.utc_now(),updated_at: NaiveDateTime.utc_now()})
# QuickBudget.Accounts.create_user_accounts(%{first_name: "Roy", last_name: "Rexota", username: "Rexota", email: "Rexota@probasegroup.com", password: "password06", auto_password: "N", user_type: "CLIENT", user_status: "ACTIVE", phone: "+260977551290",inserted_at: NaiveDateTime.utc_now(),updated_at: NaiveDateTime.utc_now()})
