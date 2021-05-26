defmodule Runosaari.Repo.Migrations.CreateIndexParagraphs do
  use Ecto.Migration

  def change do
    create table(:index_paragraphs) do
      add :content, :string, size: 3000
      add :seqnum, :integer, default: 999

      timestamps()
    end

  end
end
