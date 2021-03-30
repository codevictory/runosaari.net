defmodule Runosaari.Repo.Migrations.CreatePerformances do
  use Ecto.Migration

  def change do
    create table(:performances) do
      add :time, :naive_datetime
      add :description, :string
      add :notes, :string
      add :location_id, references(:locations, on_delete: :nothing)
      add :performer_id, references(:performers, on_delete: :nothing)

      timestamps()
    end

    create index(:performances, [:location_id])
    create index(:performances, [:performer_id])
  end
end
