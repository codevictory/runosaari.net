defmodule Runosaari.Schedule.Performance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performances" do
    field :name, :string
    field :paragraph1, :string
    field :paragraph2, :string
    field :paragraph3, :string
    field :paragraph4, :string
    field :paragraph5, :string
    field :paragraph6, :string
    field :paragraph7, :string
    field :paragraph8, :string
    field :paragraph9, :string
    field :seqnum, :integer, default: 999

    timestamps()
  end

  @doc false
  def changeset(performance, attrs) do
    performance
    |> cast(attrs, [
      :name,
      :paragraph1,
      :paragraph2,
      :paragraph3,
      :paragraph4,
      :paragraph5,
      :paragraph6,
      :paragraph7,
      :paragraph8,
      :paragraph9,
      :seqnum
    ])
    |> validate_required([:name, :seqnum])
  end
end
