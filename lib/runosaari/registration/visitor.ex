defmodule Runosaari.Registration.Visitor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visitors" do
    field :fname, :string
    field :lname, :string
    field :email, :string
    field :tel, :string
    field :date1, :boolean, default: false
    field :date2, :boolean, default: false
    field :date3, :boolean, default: false
    field :accom, :boolean, default: false
    field :shared, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(visitor, attrs) do
    visitor
    |> cast(attrs, [:fname, :lname, :email, :tel, :date1, :date2, :date3, :shared, :accom])
    |> validate_required([:fname, :lname, :email, :tel, :date1, :date2, :date3, :shared, :accom])
  end
end
