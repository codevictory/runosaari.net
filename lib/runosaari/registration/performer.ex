defmodule Runosaari.Registration.Performer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performers" do
    field :name, :string
    field :desc, :string
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
      :desc,
      :seqnum,
      :photo_path,
      :confirmed
    ])
    |> validate_required([
      :name,
      :desc,
      :seqnum,
      :photo_path,
      :confirmed
    ])
    |> unique_constraint(:email)
  end
end
