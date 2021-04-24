defmodule Runosaari.Repo.Migrations.RemoveUselessTables do
  use Ecto.Migration

  def change do
    alter table("performances") do
      remove :performer_id
      remove :location_id
    end
    drop table("locations")
    drop table("performer_performance")
  end
end
