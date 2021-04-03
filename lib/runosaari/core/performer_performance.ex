defmodule Runosaari.Core.PerformerPerformance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performer_performance" do
    field :performer_id, :id
    field :performance_id, :id

    timestamps()
  end

  @doc false
  def changeset(performer_performance, attrs) do
    performer_performance
    |> cast(attrs, [])
    |> validate_required([])
  end
end
