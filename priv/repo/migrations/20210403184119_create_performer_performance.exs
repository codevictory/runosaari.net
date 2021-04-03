defmodule Runosaari.Repo.Migrations.CreatePerformerPerformance do
  use Ecto.Migration

  def change do
    create table(:performer_performance, primary_key: false) do
      add :performer_id, references(:performers, on_delete: :nothing), primary_key: true
      add :performance_id, references(:performances, on_delete: :nothing), primary_key: true
    end

    create index(:performer_performance, [:performer_id])
    create index(:performer_performance, [:performance_id])
  end
end
