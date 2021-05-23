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
  Returns the :seqnum sorted list of confirmed performers.

  ## Examples

      iex> list_sorted_confirmed_performers()
      [%Performer{}, ...]

  """
  def list_sorted_confirmed_performers do
    Performer
    |> where([p], p.confirmed == true)
    |> order_by(:seqnum)
    |> Repo.all()
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

  alias Runosaari.Registration.Visitor

  @doc """
  Returns the list of visitors.

  ## Examples

      iex> list_visitors()
      [%Visitor{}, ...]

  """
  def list_visitors do
    Repo.all(Visitor)
  end

  @doc """
  Gets a single visitor.

  Raises `Ecto.NoResultsError` if the Visitor does not exist.

  ## Examples

      iex> get_visitor!(123)
      %Visitor{}

      iex> get_visitor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visitor!(id), do: Repo.get!(Visitor, id)

  @doc """
  Creates a visitor.

  ## Examples

      iex> create_visitor(%{field: value})
      {:ok, %Visitor{}}

      iex> create_visitor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visitor(attrs \\ %{}) do
    %Visitor{}
    |> Visitor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visitor.

  ## Examples

      iex> update_visitor(visitor, %{field: new_value})
      {:ok, %Visitor{}}

      iex> update_visitor(visitor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visitor(%Visitor{} = visitor, attrs) do
    visitor
    |> Visitor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a visitor.

  ## Examples

      iex> delete_visitor(visitor)
      {:ok, %Visitor{}}

      iex> delete_visitor(visitor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visitor(%Visitor{} = visitor) do
    Repo.delete(visitor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visitor changes.

  ## Examples

      iex> change_visitor(visitor)
      %Ecto.Changeset{data: %Visitor{}}

  """
  def change_visitor(%Visitor{} = visitor, attrs \\ %{}) do
    Visitor.changeset(visitor, attrs)
  end
end
