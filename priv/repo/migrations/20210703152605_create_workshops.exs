defmodule Runosaari.Repo.Migrations.CreateWorkshops do
  use Ecto.Migration

  def change do
    create table(:workshops) do
      add :name, :string
      add :text, :string, size: 2000
      add :seqnum, :integer

      timestamps()
    end

  end
end
