defmodule Runosaari.Pages.Index do
  use Ecto.Schema
  import Ecto.Changeset

  schema "index_paragraphs" do
    field :content, :string
    field :seqnum, :integer, default: 999

    timestamps()
  end

  @doc false
  def changeset(index, attrs) do
    index
    |> cast(attrs, [:content, :seqnum])
    |> validate_required([:content, :seqnum])
  end
end
