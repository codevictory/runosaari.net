defmodule RunosaariWeb.InfoController do
  use RunosaariWeb, :controller

  alias Runosaari.Pages
  alias Runosaari.Pages.Info

  def index(conn, _params) do
    info_paragraphs = Pages.list_sorted_info_paragraphs()
    render(conn, "index.html", info_paragraphs: info_paragraphs)
  end

  def admin(conn, _params) do
    info_paragraphs = Pages.list_info_paragraphs()
    render(conn, "admin.html", info_paragraphs: info_paragraphs)
  end

  def new(conn, _params) do
    changeset = Pages.change_info(%Info{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"info" => info_params}) do
    case Pages.create_info(info_params) do
      {:ok, info} ->
        conn
        |> put_flash(:info, "Info created successfully.")
        |> redirect(to: Routes.admin_info_path(conn, :admin))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    info = Pages.get_info!(id)
    render(conn, "show.html", info: info)
  end

  def edit(conn, %{"id" => id}) do
    info = Pages.get_info!(id)
    changeset = Pages.change_info(info)
    render(conn, "edit.html", info: info, changeset: changeset)
  end

  def update(conn, %{"id" => id, "info" => info_params}) do
    info = Pages.get_info!(id)

    case Pages.update_info(info, info_params) do
      {:ok, info} ->
        conn
        |> put_flash(:info, "Info updated successfully.")
        |> redirect(to: Routes.admin_info_path(conn, :show, info))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", info: info, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    info = Pages.get_info!(id)
    {:ok, _info} = Pages.delete_info(info)

    conn
    |> put_flash(:info, "Info deleted successfully.")
    |> redirect(to: Routes.admin_info_path(conn, :admin))
  end
end
