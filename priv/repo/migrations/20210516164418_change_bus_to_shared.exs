defmodule Runosaari.Repo.Migrations.ChangeBusToShared do
  use Ecto.Migration

  def change do
    alter table("visitors") do
      remove :bus
      add :shared, :boolean, default: false, null: false
    end
  end
end
