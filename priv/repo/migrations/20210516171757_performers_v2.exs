defmodule Runosaari.Repo.Migrations.PerformersV2 do
  use Ecto.Migration

  def change do
    alter table("performers") do
      remove :email
      remove :fname
      remove :lname
      remove :tel
      remove :date1
      remove :date2
      remove :date3
      remove :bus
      remove :accom
      add :name, :string
    end
  end
end
