defmodule RunosaariWeb.SurvivalController do
  use RunosaariWeb, :controller

  alias Runosaari.Pages
  alias Runosaari.Pages.Survival

  def index(conn, _params) do
    survival_items = Pages.list_survival_items()
    render(conn, "admin.html", survival_items: survival_items)
  end

  def admin(conn, _params) do
    survival_items = Pages.list_survival_items()
    render(conn, "admin.html", survival_items: survival_items)
  end

  def new(conn, _params) do
    changeset = Pages.change_survival(%Survival{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"survival" => survival_params}) do
    case Pages.create_survival(survival_params) do
      {:ok, survival} ->
        conn
        |> put_flash(:info, "Survival created successfully.")
        |> redirect(to: Routes.admin_survival_path(conn, :show, survival))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    survival = Pages.get_survival!(id)
    render(conn, "show.html", survival: survival)
  end

  def edit(conn, %{"id" => id}) do
    survival = Pages.get_survival!(id)
    changeset = Pages.change_survival(survival)
    render(conn, "edit.html", survival: survival, changeset: changeset)
  end

  def update(conn, %{"id" => id, "survival" => survival_params}) do
    survival = Pages.get_survival!(id)

    case Pages.update_survival(survival, survival_params) do
      {:ok, survival} ->
        conn
        |> put_flash(:info, "Survival updated successfully.")
        |> redirect(to: Routes.admin_survival_path(conn, :show, survival))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", survival: survival, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    survival = Pages.get_survival!(id)
    {:ok, _survival} = Pages.delete_survival(survival)

    conn
    |> put_flash(:info, "Survival deleted successfully.")
    |> redirect(to: Routes.admin_survival_path(conn, :admin))
  end
end
