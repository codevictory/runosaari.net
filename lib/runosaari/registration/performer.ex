defmodule Runosaari.Registration.Performer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performers" do
    field :confirmed, :boolean, default: false
    field :email, :string
    field :fname, :string
    field :lname, :string
    field :desc, :string
    field :tel, :string
    field :date1, :boolean, default: false
    field :date2, :boolean, default: false
    field :date3, :boolean, default: false
    field :bus, :boolean, default: false
    field :accom, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(performer, attrs) do
    performer
    |> cast(attrs, [
      :fname,
      :lname,
      :email,
      :tel,
      :confirmed,
      :desc,
      :date1,
      :date2,
      :date3,
      :bus,
      :accom
    ])
    |> validate_required([
      :fname,
      :lname,
      :email,
      :tel,
      :confirmed,
      :desc,
      :date1,
      :date2,
      :date3,
      :bus,
      :accom
    ])
    |> unique_constraint(:email)
  end
end
