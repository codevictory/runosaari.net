defmodule Runosaari.Repo.Migrations.MultiplePerformersParagraphs do
  use Ecto.Migration

  def change do
    alter table("performers") do
      add :paragraph1, :string, size: 2000, null: true
      add :paragraph2, :string, size: 2000, null: true
      add :paragraph3, :string, size: 2000, null: true
      add :paragraph4, :string, size: 2000, null: true
      add :paragraph5, :string, size: 2000, null: true
      remove :desc
    end
  end
end
