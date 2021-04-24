defmodule Runosaari.Repo.Migrations.FixPerformanceFields do
  use Ecto.Migration

  def up do
    alter table("performances") do
      remove :notes
      remove :time
      remove :description
      add :desc, :string, size: 2000
      add :name, :string
    end
  end

  def down do
    alter table("performances") do
      add :notes, :string
      add :time, :naive_datetime
      remove :name
    end
  end
end
