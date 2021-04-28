defmodule Runosaari.Repo.Migrations.AddSequenceNumber do
  use Ecto.Migration

  def change do
    alter table("performances") do
      add :seqnum, :integer
    end

    alter table("performers") do
      add :seqnum, :integer
    end
  end
end
