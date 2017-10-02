defmodule Test13.Accounts.Post do
  use Ecto.Schema

  schema "accounts_posts" do
    field :body, :string
    field :title, :string
    field :user, :id

    timestamps()
  end
end
