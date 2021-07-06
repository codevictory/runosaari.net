defmodule RunosaariWeb.WorkshopControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Schedule

  @create_attrs %{name: "some name", text: "some text", seqnum: 42}
  @update_attrs %{name: "some updated name", text: "some updated text", seqnum: 43}
  @invalid_attrs %{name: nil, text: nil, seqnum: nil}

  def fixture(:workshop) do
    {:ok, workshop} = Schedule.create_workshop(@create_attrs)
    workshop
  end

  describe "admin" do
    test "lists all workshops", %{conn: conn} do
      conn = get(conn, Routes.admin_workshop_path(conn, :admin))
      assert html_response(conn, 200) =~ "HALLINTA - Työpajat"
    end
  end

  describe "new workshop" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_workshop_path(conn, :new))
      assert html_response(conn, 200) =~ "Luo uusi työpaja"
    end
  end

  describe "create workshop" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_workshop_path(conn, :create), workshop: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_workshop_path(conn, :show, id)

      conn = get(conn, Routes.admin_workshop_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Työpajan tiedot"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_workshop_path(conn, :create), workshop: @invalid_attrs)
      assert html_response(conn, 200) =~ "Luo uusi työpaja"
    end
  end

  describe "edit workshop" do
    setup [:create_workshop]

    test "renders form for editing chosen workshop", %{conn: conn, workshop: workshop} do
      conn = get(conn, Routes.admin_workshop_path(conn, :edit, workshop))
      assert html_response(conn, 200) =~ "Muokkaa työpajan tietoja"
    end
  end

  describe "update workshop" do
    setup [:create_workshop]

    test "redirects when data is valid", %{conn: conn, workshop: workshop} do
      conn =
        put(conn, Routes.admin_workshop_path(conn, :update, workshop), workshop: @update_attrs)

      assert redirected_to(conn) == Routes.admin_workshop_path(conn, :show, workshop)

      conn = get(conn, Routes.admin_workshop_path(conn, :show, workshop))
      assert html_response(conn, 200) =~ "some updated text"
    end

    test "renders errors when data is invalid", %{conn: conn, workshop: workshop} do
      conn =
        put(conn, Routes.admin_workshop_path(conn, :update, workshop), workshop: @invalid_attrs)

      assert html_response(conn, 200) =~ "Muokkaa työpajan tietoja"
    end
  end

  describe "delete workshop" do
    setup [:create_workshop]

    test "deletes chosen workshop", %{conn: conn, workshop: workshop} do
      conn = delete(conn, Routes.admin_workshop_path(conn, :delete, workshop))
      assert redirected_to(conn) == Routes.admin_workshop_path(conn, :admin)

      assert_error_sent 404, fn ->
        get(conn, Routes.admin_workshop_path(conn, :show, workshop))
      end
    end
  end

  defp create_workshop(_) do
    workshop = fixture(:workshop)
    %{workshop: workshop}
  end
end
