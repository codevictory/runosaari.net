defmodule Runosaari.Repo.Migrations.CreatePerformers do
  use Ecto.Migration

  def change do
    create table(:performers) do
      add :performerId, :integer
      add :fname, :string
      add :lname, :string
      add :email, :string
      add :tel, :string
      add :confirmed, :boolean, default: false, null: false
      add :notes, :string

      timestamps()
    end

    create unique_index(:performers, [:performerId])
    create unique_index(:performers, [:email])
  end
end
