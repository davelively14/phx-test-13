defmodule Test13.Repo.Migrations.CreateTest13.Accounts.Post do
  use Ecto.Migration

  def change do
    create table(:accounts_posts) do
      add :title, :string
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:accounts_posts, [:user])
  end
end
