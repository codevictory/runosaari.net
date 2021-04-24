defmodule Runosaari.Schedule.Performance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performances" do
    field :description, :string
    field :notes, :string
    field :time, :naive_datetime
    field :performer_id, :id

    timestamps()
  end

  @doc false
  def changeset(performance, attrs) do
    performance
    |> cast(attrs, [:time, :description, :notes])
    |> validate_required([:time, :description, :notes])
  end
end
