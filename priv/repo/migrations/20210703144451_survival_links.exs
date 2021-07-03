defmodule Runosaari.Repo.Migrations.SurvivalLinks do
  use Ecto.Migration

  def change do
    alter table("survival_items") do
      add :link, :string, null: true
    end
  end
end
