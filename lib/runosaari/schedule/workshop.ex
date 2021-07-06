defmodule Runosaari.Schedule.Workshop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workshops" do
    field :name, :string
    field :text, :string
    field :seqnum, :integer

    timestamps()
  end

  @doc false
  def changeset(workshop, attrs) do
    workshop
    |> cast(attrs, [:name, :text, :seqnum])
    |> validate_required([:name, :text, :seqnum])
  end
end
