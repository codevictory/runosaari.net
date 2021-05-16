defmodule Runosaari.Registration.Performer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performers" do
    field :name, :string
    field :confirmed, :boolean, default: false
    field :desc, :string
    field :seqnum, :integer, default: 999

    timestamps()
  end

  @doc false
  def changeset(performer, attrs) do
    performer
    |> cast(attrs, [
      :name,
      :confirmed,
      :desc,
      :seqnum
    ])
    |> validate_required([
      :name,
      :confirmed,
      :desc,
      :seqnum
    ])
    |> unique_constraint(:email)
  end
end
