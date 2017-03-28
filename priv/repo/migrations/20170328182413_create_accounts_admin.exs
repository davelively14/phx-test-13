defmodule Test13.Repo.Migrations.CreateTest13.Accounts.Admin do
  use Ecto.Migration

  def change do
    create table(:accounts_admin) do
      add :username, :string
      add :email, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:accounts_admin, [:username])
    create unique_index(:accounts_admin, [:email])
  end
end
