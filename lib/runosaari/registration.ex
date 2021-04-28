defmodule Runosaari.Registration do
  @moduledoc """
  The Registration context.
  """

  import Ecto.Query, warn: false
  alias Runosaari.Repo

  alias Runosaari.Registration.Performer

  @doc """
  Returns the list of performers.

  ## Examples

      iex> list_performers()
      [%Performer{}, ...]

  """
  def list_performers do
    Repo.all(Performer)
  end

  @doc """
  Returns the list of performers.

  ## Examples

      iex> list_performers()
      [%Performer{}, ...]

  """
  def list_sorted_performers do
    Repo.all(Performer |> order_by(:seqnum))
  end

  @doc """
  Gets a single performer.

  Raises `Ecto.NoResultsError` if the Performer does not exist.

  ## Examples

      iex> get_performer!(123)
      %Performer{}

      iex> get_performer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_performer!(id), do: Repo.get!(Performer, id)

  @doc """
  Creates a performer.

  ## Examples

      iex> create_performer(%{field: value})
      {:ok, %Performer{}}

      iex> create_performer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_performer(attrs \\ %{}) do
    %Performer{}
    |> Performer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a performer.

  ## Examples

      iex> update_performer(performer, %{field: new_value})
      {:ok, %Performer{}}

      iex> update_performer(performer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_performer(%Performer{} = performer, attrs) do
    performer
    |> Performer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a performer.

  ## Examples

      iex> delete_performer(performer)
      {:ok, %Performer{}}

      iex> delete_performer(performer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_performer(%Performer{} = performer) do
    Repo.delete(performer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking performer changes.

  ## Examples

      iex> change_performer(performer)
      %Ecto.Changeset{data: %Performer{}}

  """
  def change_performer(%Performer{} = performer, attrs \\ %{}) do
    Performer.changeset(performer, attrs)
  end
end
