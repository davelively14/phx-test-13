defmodule Test13.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :email, :string
    field :password_digest, :string
    field :username, :string

    timestamps()
  end
end
