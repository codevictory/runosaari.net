defmodule Runosaari.Repo.Migrations.RemovePerformerSeqnum do
  use Ecto.Migration

  def change do
    alter table("performers") do
      remove :seqnum
    end
  end
end
