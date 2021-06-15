defmodule Runosaari.Pages.Survival do
  use Ecto.Schema
  import Ecto.Changeset

  schema "survival_items" do
    field :content, :string
    field :seqnum, :integer, default: 999

    timestamps()
  end

  @doc false
  def changeset(survival, attrs) do
    survival
    |> cast(attrs, [:content, :seqnum])
    |> validate_required([:content, :seqnum])
  end
end
