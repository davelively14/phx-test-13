defmodule Test13.Accounts.Admin do
  use Ecto.Schema

  schema "accounts_admin" do
    field :email, :string
    field :password, :string
    field :username, :string

    timestamps()
  end
end
