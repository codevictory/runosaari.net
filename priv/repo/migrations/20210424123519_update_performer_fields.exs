defmodule Runosaari.Repo.Migrations.UpdatePerformerFields do
  use Ecto.Migration

  def change do
    alter table("performers") do
      remove :notes
      add :desc, :string, size: 1000
      add :date1, :boolean, default: false, null: false
      add :date2, :boolean, default: false, null: false
      add :date3, :boolean, default: false, null: false
      add :bus, :boolean, default: false, null: false
      add :accom, :boolean, default: false, null: false
    end
  end
end
