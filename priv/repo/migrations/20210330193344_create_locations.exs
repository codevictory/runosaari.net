defmodule Runosaari.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :address, :string
      add :reserved_seats, :integer
      add :max_seats, :integer
      add :description, :string

      timestamps()
    end

  end
end
