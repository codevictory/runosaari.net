defmodule Runosaari.Pages do
  @moduledoc """
  The Pages context.
  """

  import Ecto.Query, warn: false
  alias Runosaari.Repo

  alias Runosaari.Pages.Index

  @doc """
  Returns the list of index_paragraphs.

  ## Examples

      iex> list_index_paragraphs()
      [%Index{}, ...]

  """
  def list_index_paragraphs do
    Repo.all(Index)
  end

  @doc """
  Returns the list of paragraphs sorted by seqnum.

  ## Examples

      iex> list_sorted_index_paragraphs()
      [%Index{}, ...]

  """
  def list_sorted_index_paragraphs do
    Repo.all(Index |> order_by(:seqnum))
  end

  @doc """
  Gets a single index.

  Raises `Ecto.NoResultsError` if the Index does not exist.

  ## Examples

      iex> get_index!(123)
      %Index{}

      iex> get_index!(456)
      ** (Ecto.NoResultsError)

  """
  def get_index!(id), do: Repo.get!(Index, id)

  @doc """
  Creates a index.

  ## Examples

      iex> create_index(%{field: value})
      {:ok, %Index{}}

      iex> create_index(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_index(attrs \\ %{}) do
    %Index{}
    |> Index.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a index.

  ## Examples

      iex> update_index(index, %{field: new_value})
      {:ok, %Index{}}

      iex> update_index(index, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_index(%Index{} = index, attrs) do
    index
    |> Index.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a index.

  ## Examples

      iex> delete_index(index)
      {:ok, %Index{}}

      iex> delete_index(index)
      {:error, %Ecto.Changeset{}}

  """
  def delete_index(%Index{} = index) do
    Repo.delete(index)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking index changes.

  ## Examples

      iex> change_index(index)
      %Ecto.Changeset{data: %Index{}}

  """
  def change_index(%Index{} = index, attrs \\ %{}) do
    Index.changeset(index, attrs)
  end

  alias Runosaari.Pages.Info

  @doc """
  Returns the list of info_paragraphs.

  ## Examples

      iex> list_info_paragraphs()
      [%Info{}, ...]

  """
  def list_info_paragraphs do
    Repo.all(Info)
  end

  @doc """
  Returns the list of info_paragraphs.

  ## Examples

      iex> list_info_paragraphs()
      [%Info{}, ...]

  """
  def list_sorted_info_paragraphs do
    Repo.all(Info |> order_by(:seqnum))
  end

  @doc """
  Gets a single info.

  Raises `Ecto.NoResultsError` if the Info does not exist.

  ## Examples

      iex> get_info!(123)
      %Info{}

      iex> get_info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_info!(id), do: Repo.get!(Info, id)

  @doc """
  Creates a info.

  ## Examples

      iex> create_info(%{field: value})
      {:ok, %Info{}}

      iex> create_info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_info(attrs \\ %{}) do
    %Info{}
    |> Info.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a info.

  ## Examples

      iex> update_info(info, %{field: new_value})
      {:ok, %Info{}}

      iex> update_info(info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_info(%Info{} = info, attrs) do
    info
    |> Info.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a info.

  ## Examples

      iex> delete_info(info)
      {:ok, %Info{}}

      iex> delete_info(info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_info(%Info{} = info) do
    Repo.delete(info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking info changes.

  ## Examples

      iex> change_info(info)
      %Ecto.Changeset{data: %Info{}}

  """
  def change_info(%Info{} = info, attrs \\ %{}) do
    Info.changeset(info, attrs)
  end

  alias Runosaari.Pages.Survival

  @doc """
  Returns the list of survival_items.

  ## Examples

      iex> list_survival_items()
      [%Survival{}, ...]

  """
  def list_survival_items do
    Repo.all(Survival)
  end

  @doc """
  Returns the list of survival_items.

  ## Examples

      iex> list_survival_items()
      [%Survival{}, ...]

  """
  def list_sorted_survival_items do
    Repo.all(Survival |> order_by(:seqnum))
  end

  @doc """
  Gets a single survival.

  Raises `Ecto.NoResultsError` if the Survival does not exist.

  ## Examples

      iex> get_survival!(123)
      %Survival{}

      iex> get_survival!(456)
      ** (Ecto.NoResultsError)

  """
  def get_survival!(id), do: Repo.get!(Survival, id)

  @doc """
  Creates a survival.

  ## Examples

      iex> create_survival(%{field: value})
      {:ok, %Survival{}}

      iex> create_survival(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_survival(attrs \\ %{}) do
    %Survival{}
    |> Survival.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a survival.

  ## Examples

      iex> update_survival(survival, %{field: new_value})
      {:ok, %Survival{}}

      iex> update_survival(survival, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_survival(%Survival{} = survival, attrs) do
    survival
    |> Survival.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a survival.

  ## Examples

      iex> delete_survival(survival)
      {:ok, %Survival{}}

      iex> delete_survival(survival)
      {:error, %Ecto.Changeset{}}

  """
  def delete_survival(%Survival{} = survival) do
    Repo.delete(survival)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking survival changes.

  ## Examples

      iex> change_survival(survival)
      %Ecto.Changeset{data: %Survival{}}

  """
  def change_survival(%Survival{} = survival, attrs \\ %{}) do
    Survival.changeset(survival, attrs)
  end
end
