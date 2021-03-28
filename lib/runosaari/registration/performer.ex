defmodule Runosaari.Registration.Performer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performers" do
    field :confirmed, :boolean, default: false
    field :email, :string
    field :fname, :string
    field :lname, :string
    field :notes, :string
    field :tel, :string

    timestamps()
  end

  @doc false
  def changeset(performer, attrs) do
    performer
    |> cast(attrs, [:fname, :lname, :email, :tel, :confirmed, :notes])
    |> validate_required([:fname, :lname, :email, :tel, :confirmed, :notes])
    |> unique_constraint(:email)
  end
end
