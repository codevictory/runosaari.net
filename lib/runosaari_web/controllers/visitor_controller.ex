defmodule RunosaariWeb.VisitorController do
  use RunosaariWeb, :controller

  alias Runosaari.Registration
  alias Runosaari.Registration.Visitor

  def index(conn, _params) do
    visitors = Registration.list_visitors()
    render(conn, "index.html", visitors: visitors)
  end

  def new(conn, _params) do
    changeset = Registration.change_visitor(%Visitor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visitor" => visitor_params}) do
    case Registration.create_visitor(visitor_params) do
      {:ok, _visitor} ->
        conn
        |> redirect(to: Routes.visitor_path(conn, :confirmation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visitor = Registration.get_visitor!(id)
    render(conn, "show.html", visitor: visitor)
  end

  def edit(conn, %{"id" => id}) do
    visitor = Registration.get_visitor!(id)
    changeset = Registration.change_visitor(visitor)
    render(conn, "edit.html", visitor: visitor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visitor" => visitor_params}) do
    visitor = Registration.get_visitor!(id)

    case Registration.update_visitor(visitor, visitor_params) do
      {:ok, visitor} ->
        conn
        |> put_flash(:info, "Visitor updated successfully.")
        |> redirect(to: Routes.admin_visitor_path(conn, :show, visitor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visitor: visitor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visitor = Registration.get_visitor!(id)
    {:ok, _visitor} = Registration.delete_visitor(visitor)

    conn
    |> put_flash(:info, "Visitor deleted successfully.")
    |> redirect(to: Routes.admin_visitor_path(conn, :index))
  end

  def confirmation(conn, _params) do
    render(conn, "confirmation.html")
  end
end
