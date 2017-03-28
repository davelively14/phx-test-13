defmodule Test13.Repo.Migrations.CreateTest13.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :username, :string
      add :email, :string
      add :password_digest, :string

      timestamps()
    end

    create unique_index(:accounts_users, [:username])
    create unique_index(:accounts_users, [:email])
  end
end
