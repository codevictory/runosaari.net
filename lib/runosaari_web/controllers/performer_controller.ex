defmodule RunosaariWeb.PerformerController do
  use RunosaariWeb, :controller

  alias Runosaari.Registration
  alias Runosaari.Registration.Performer

  def index(conn, _params) do
    performers = Registration.list_sorted_confirmed_performers()
    render(conn, "index.html", performers: performers)
  end

  def admin(conn, _params) do
    performers = Registration.list_performers()
    render(conn, "admin.html", performers: performers)
  end

  def new(conn, _params) do
    changeset = Registration.change_performer(%Performer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"performer" => performer_params}) do
    %{"photo" => photo_params} = performer_params
    file_uuid = UUID.uuid4(:hex)
    photo_filename = photo_params.filename
    unique_filename = "performer_photos/#{file_uuid}-#{photo_filename}"
    {:ok, photo_binary} = File.read(photo_params.path)
    bucket_name = System.get_env("S3_BUCKET_NAME")
    public_host = System.get_env("S3_PUBLIC_HOST")

    ExAws.S3.put_object(bucket_name, unique_filename, photo_binary)
    |> ExAws.request!()

    updated_params =
      performer_params
      |> Map.delete("photo")
      |> Map.put(
        "photo_path",
        "https://#{public_host}/#{bucket_name}/#{unique_filename}"
      )

    case Registration.create_performer(updated_params) do
      {:ok, _performer} ->
        conn
        |> put_flash(
          :info,
          "Esiintyjä tallennettu. Tiedot ovat julkisia esiintyjän ollessa vahvistettu."
        )
        |> redirect(to: Routes.admin_performer_path(conn, :admin))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    performer = Registration.get_performer!(id)
    render(conn, "show.html", performer: performer)
  end

  def edit(conn, %{"id" => id}) do
    performer = Registration.get_performer!(id)
    changeset = Registration.change_performer(performer)
    render(conn, "edit.html", performer: performer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "performer" => performer_params}) do
    performer = Registration.get_performer!(id)

    case Registration.update_performer(performer, performer_params) do
      {:ok, performer} ->
        conn
        |> put_flash(:info, "Esiintyjän tiedot päivitetty.")
        |> redirect(to: Routes.admin_performer_path(conn, :admin))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", performer: performer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    performer = Registration.get_performer!(id)
    {:ok, _performer} = Registration.delete_performer(performer)

    conn
    |> put_flash(:info, "Esiintyjä poistettu.")
    |> redirect(to: Routes.admin_performer_path(conn, :admin))
  end
end
