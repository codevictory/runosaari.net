defmodule Runosaari.Repo.Migrations.CreateSurvivalItems do
  use Ecto.Migration

  def change do
    create table(:survival_items) do
      add :content, :string, size: 3000
      add :seqnum, :integer

      timestamps()
    end

  end
end
