defmodule Runosaari.Repo.Migrations.Archives do
  use Ecto.Migration

  def change do
    alter table("performers") do
      add :archived, :integer, null: true
    end
  end
end
