defmodule Runosaari.Schedule.Performance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performances" do
    field :name, :string
    field :desc, :string

    timestamps()
  end

  @doc false
  def changeset(performance, attrs) do
    performance
    |> cast(attrs, [:name, :desc])
    |> validate_required([:name, :desc])
  end
end
