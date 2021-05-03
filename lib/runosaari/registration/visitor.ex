defmodule Runosaari.Registration.Visitor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visitors" do
    field :accom, :boolean, default: false
    field :bus, :boolean, default: false
    field :date1, :boolean, default: false
    field :date2, :boolean, default: false
    field :date3, :boolean, default: false
    field :email, :string
    field :fname, :string
    field :lname, :string
    field :tel, :string

    timestamps()
  end

  @doc false
  def changeset(visitor, attrs) do
    visitor
    |> cast(attrs, [:fname, :lname, :email, :tel, :date1, :date2, :date3, :bus, :accom])
    |> validate_required([:fname, :lname, :email, :tel, :date1, :date2, :date3, :bus, :accom])
  end
end
