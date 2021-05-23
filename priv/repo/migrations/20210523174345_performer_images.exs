defmodule Runosaari.Repo.Migrations.PerformerImages do
  use Ecto.Migration

  def change do
    alter table("performers") do
      add :photo_path, :string
    end
  end
end
