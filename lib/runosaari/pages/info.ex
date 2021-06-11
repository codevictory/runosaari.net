defmodule Runosaari.Pages.Info do
  use Ecto.Schema
  import Ecto.Changeset

  schema "info_paragraphs" do
    field :content, :string
    field :seqnum, :integer, default: 999

    timestamps()
  end

  @doc false
  def changeset(info, attrs) do
    info
    |> cast(attrs, [:content, :seqnum])
    |> validate_required([:content, :seqnum])
  end
end
