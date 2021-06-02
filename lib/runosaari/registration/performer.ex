defmodule Runosaari.Registration.Performer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performers" do
    field :name, :string
    field :paragraph1, :string
    field :paragraph2, :string
    field :paragraph3, :string
    field :paragraph4, :string
    field :paragraph5, :string
    field :seqnum, :integer, default: 999
    field :photo_path, :string
    field :confirmed, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(performer, attrs) do
    performer
    |> cast(attrs, [
      :name,
      :seqnum,
      :paragraph1,
      :paragraph2,
      :paragraph3,
      :paragraph4,
      :paragraph5,
      :photo_path,
      :confirmed
    ])
    |> validate_required([
      :name,
      :seqnum,
      :photo_path,
      :confirmed
    ])
    |> unique_constraint(:email)
  end
end
