defmodule RunosaariWeb.PerformanceController do
  use RunosaariWeb, :controller

  alias Runosaari.Schedule
  alias Runosaari.Schedule.Performance

  def index(conn, _params) do
    performances = Schedule.list_performances()
    render(conn, "index.html", performances: performances)
  end

  def new(conn, _params) do
    changeset = Schedule.change_performance(%Performance{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"performance" => performance_params}) do
    case Schedule.create_performance(performance_params) do
      {:ok, performance} ->
        conn
        |> put_flash(:info, "Performance created successfully.")
        |> redirect(to: Routes.performance_path(conn, :show, performance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    performance = Schedule.get_performance!(id)
    render(conn, "show.html", performance: performance)
  end

  def edit(conn, %{"id" => id}) do
    performance = Schedule.get_performance!(id)
    changeset = Schedule.change_performance(performance)
    render(conn, "edit.html", performance: performance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "performance" => performance_params}) do
    performance = Schedule.get_performance!(id)

    case Schedule.update_performance(performance, performance_params) do
      {:ok, performance} ->
        conn
        |> put_flash(:info, "Performance updated successfully.")
        |> redirect(to: Routes.performance_path(conn, :show, performance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", performance: performance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    performance = Schedule.get_performance!(id)
    {:ok, _performance} = Schedule.delete_performance(performance)

    conn
    |> put_flash(:info, "Performance deleted successfully.")
    |> redirect(to: Routes.performance_path(conn, :index))
  end
end
