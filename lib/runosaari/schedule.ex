defmodule Runosaari.Schedule do
  @moduledoc """
  The Schedule context.
  """

  import Ecto.Query, warn: false
  alias Runosaari.Repo

  alias Runosaari.Schedule.Performance

  @doc """
  Returns the list of performances.

  ## Examples

      iex> list_performances()
      [%Performance{}, ...]

  """
  def list_performances do
    Repo.all(Performance)
  end

  @doc """
  Returns the list of performances sorted by seqnum.

  ## Examples

      iex> list_sorted_performances()
      [%Performance{}, ...]

  """
  def list_sorted_performances do
    Repo.all(Performance |> where([p], not is_nil(p.seqnum)) |> order_by(:seqnum))
  end

  @doc """
  Gets a single performance.

  Raises `Ecto.NoResultsError` if the Performance does not exist.

  ## Examples

      iex> get_performance!(123)
      %Performance{}

      iex> get_performance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_performance!(id), do: Repo.get!(Performance, id)

  @doc """
  Creates a performance.

  ## Examples

      iex> create_performance(%{field: value})
      {:ok, %Performance{}}

      iex> create_performance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_performance(attrs \\ %{}) do
    %Performance{}
    |> Performance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a performance.

  ## Examples

      iex> update_performance(performance, %{field: new_value})
      {:ok, %Performance{}}

      iex> update_performance(performance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_performance(%Performance{} = performance, attrs) do
    performance
    |> Performance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a performance.

  ## Examples

      iex> delete_performance(performance)
      {:ok, %Performance{}}

      iex> delete_performance(performance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_performance(%Performance{} = performance) do
    Repo.delete(performance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking performance changes.

  ## Examples

      iex> change_performance(performance)
      %Ecto.Changeset{data: %Performance{}}

  """
  def change_performance(%Performance{} = performance, attrs \\ %{}) do
    Performance.changeset(performance, attrs)
  end

  alias Runosaari.Schedule.Workshop

  @doc """
  Returns the list of workshops.

  ## Examples

      iex> list_workshops()
      [%Workshop{}, ...]

  """
  def list_workshops do
    Repo.all(Workshop)
  end

  @doc """
  Returns the list of workshops.

  ## Examples

      iex> list_workshops()
      [%Workshop{}, ...]

  """
  def list_sorted_workshops do
    Repo.all(Workshop |> order_by(:seqnum))
  end

  @doc """
  Gets a single workshop.

  Raises `Ecto.NoResultsError` if the Workshop does not exist.

  ## Examples

      iex> get_workshop!(123)
      %Workshop{}

      iex> get_workshop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workshop!(id), do: Repo.get!(Workshop, id)

  @doc """
  Creates a workshop.

  ## Examples

      iex> create_workshop(%{field: value})
      {:ok, %Workshop{}}

      iex> create_workshop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workshop(attrs \\ %{}) do
    %Workshop{}
    |> Workshop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a workshop.

  ## Examples

      iex> update_workshop(workshop, %{field: new_value})
      {:ok, %Workshop{}}

      iex> update_workshop(workshop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workshop(%Workshop{} = workshop, attrs) do
    workshop
    |> Workshop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a workshop.

  ## Examples

      iex> delete_workshop(workshop)
      {:ok, %Workshop{}}

      iex> delete_workshop(workshop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workshop(%Workshop{} = workshop) do
    Repo.delete(workshop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workshop changes.

  ## Examples

      iex> change_workshop(workshop)
      %Ecto.Changeset{data: %Workshop{}}

  """
  def change_workshop(%Workshop{} = workshop, attrs \\ %{}) do
    Workshop.changeset(workshop, attrs)
  end
end
