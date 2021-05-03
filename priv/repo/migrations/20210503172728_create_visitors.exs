defmodule Runosaari.Repo.Migrations.CreateVisitors do
  use Ecto.Migration

  def change do
    create table(:visitors) do
      add :fname, :string
      add :lname, :string
      add :email, :string
      add :tel, :string
      add :date1, :boolean, default: false, null: false
      add :date2, :boolean, default: false, null: false
      add :date3, :boolean, default: false, null: false
      add :bus, :boolean, default: false, null: false
      add :accom, :boolean, default: false, null: false

      timestamps()
    end

  end
end
