defmodule Runosaari.Repo.Migrations.AddSequenceNumber do
  use Ecto.Migration

  def change do
    alter table("performances") do
      add :sequence_number, :integer
    end

    alter table("performers") do
      add :sequence_number, :integer
    end
  end
end
