defmodule RunosaariWeb.WorkshopController do
  use RunosaariWeb, :controller

  alias Runosaari.Schedule
  alias Runosaari.Schedule.Workshop

  def index(conn, _params) do
    workshops = Schedule.list_workshops()
    render(conn, "index.html", workshops: workshops)
  end

  def admin(conn, _params) do
    workshops = Schedule.list_workshops()
    render(conn, "admin.html", workshops: workshops)
  end

  def new(conn, _params) do
    changeset = Schedule.change_workshop(%Workshop{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"workshop" => workshop_params}) do
    case Schedule.create_workshop(workshop_params) do
      {:ok, workshop} ->
        conn
        |> put_flash(:info, "Workshop created successfully.")
        |> redirect(to: Routes.admin_workshop_path(conn, :show, workshop))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    workshop = Schedule.get_workshop!(id)
    render(conn, "show.html", workshop: workshop)
  end

  def edit(conn, %{"id" => id}) do
    workshop = Schedule.get_workshop!(id)
    changeset = Schedule.change_workshop(workshop)
    render(conn, "edit.html", workshop: workshop, changeset: changeset)
  end

  def update(conn, %{"id" => id, "workshop" => workshop_params}) do
    workshop = Schedule.get_workshop!(id)

    case Schedule.update_workshop(workshop, workshop_params) do
      {:ok, workshop} ->
        conn
        |> put_flash(:info, "Workshop updated successfully.")
        |> redirect(to: Routes.admin_workshop_path(conn, :show, workshop))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", workshop: workshop, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    workshop = Schedule.get_workshop!(id)
    {:ok, _workshop} = Schedule.delete_workshop(workshop)

    conn
    |> put_flash(:info, "Workshop deleted successfully.")
    |> redirect(to: Routes.admin_workshop_path(conn, :admin))
  end
end
