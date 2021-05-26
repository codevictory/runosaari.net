defmodule RunosaariWeb.IndexController do
  use RunosaariWeb, :controller

  alias Runosaari.Pages
  alias Runosaari.Pages.Index

  def index(conn, _params) do
    index_paragraphs = Pages.list_index_paragraphs()
    render(conn, "index.html", index_paragraphs: index_paragraphs)
  end

  def admin(conn, _params) do
    index_paragraphs = Pages.list_index_paragraphs()
    render(conn, "admin.html", index_paragraphs: index_paragraphs)
  end

  def new(conn, _params) do
    changeset = Pages.change_index(%Index{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"index" => index_params}) do
    case Pages.create_index(index_params) do
      {:ok, index} ->
        conn
        |> put_flash(:info, "Index created successfully.")
        |> redirect(to: Routes.admin_index_path(conn, :show, index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    index = Pages.get_index!(id)
    render(conn, "show.html", index: index)
  end

  def edit(conn, %{"id" => id}) do
    index = Pages.get_index!(id)
    changeset = Pages.change_index(index)
    render(conn, "edit.html", index: index, changeset: changeset)
  end

  def update(conn, %{"id" => id, "index" => index_params}) do
    index = Pages.get_index!(id)

    case Pages.update_index(index, index_params) do
      {:ok, index} ->
        conn
        |> put_flash(:info, "Index updated successfully.")
        |> redirect(to: Routes.admin_index_path(conn, :show, index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", index: index, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    index = Pages.get_index!(id)
    {:ok, _index} = Pages.delete_index(index)

    conn
    |> put_flash(:info, "Index deleted successfully.")
    |> redirect(to: Routes.index_path(conn, :index))
  end
end
