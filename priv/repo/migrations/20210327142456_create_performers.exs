defmodule Runosaari.Repo.Migrations.CreatePerformers do
  use Ecto.Migration

  def change do
    create table(:performers) do
      add :email, :string
      add :fname, :string
      add :lname, :string
      add :tel, :string
      add :confirmed, :boolean, default: false, null: false
      add :notes, :string

      timestamps()
    end

    create unique_index(:performers, [:email])
  end
end
