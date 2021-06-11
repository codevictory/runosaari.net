defmodule Runosaari.Repo.Migrations.CreateInfoParagraphs do
  use Ecto.Migration

  def change do
    create table(:info_paragraphs) do
      add :content, :string, size: 3000
      add :seqnum, :integer

      timestamps()
    end

  end
end
