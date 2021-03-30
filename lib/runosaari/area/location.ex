defmodule Runosaari.Area.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :address, :string
    field :description, :string
    field :max_seats, :integer
    field :name, :string
    field :reserved_seats, :integer

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :address, :reserved_seats, :max_seats, :description])
    |> validate_required([:name, :address, :reserved_seats, :max_seats, :description])
  end
end
