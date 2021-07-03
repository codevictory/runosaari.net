defmodule Runosaari.Repo.Migrations.MultiplePerformanceParagraphs do
  use Ecto.Migration

  def down do
    alter table("performances") do
      add :desc, :string, size: 2000, null: true
      remove :paragraph1
      remove :paragraph2
      remove :paragraph3
      remove :paragraph4
      remove :paragraph5
      remove :paragraph6
      remove :paragraph7
      remove :paragraph8
      remove :paragraph9
    end
  end
  def up do
    alter table("performances") do
      remove :desc
      add :paragraph1, :string, size: 2000, null: true
      add :paragraph2, :string, size: 2000, null: true
      add :paragraph3, :string, size: 2000, null: true
      add :paragraph4, :string, size: 2000, null: true
      add :paragraph5, :string, size: 2000, null: true
      add :paragraph6, :string, size: 2000, null: true
      add :paragraph7, :string, size: 2000, null: true
      add :paragraph8, :string, size: 2000, null: true
      add :paragraph9, :string, size: 2000, null: true
    end
  end
end
