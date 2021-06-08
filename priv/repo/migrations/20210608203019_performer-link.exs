defmodule :"Elixir.Runosaari.Repo.Migrations.Performer-link" do
  use Ecto.Migration

  def change do
    alter table("performers") do
      add :link, :string
    end
  end
end
