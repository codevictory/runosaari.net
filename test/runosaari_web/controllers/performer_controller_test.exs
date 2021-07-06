defmodule RunosaariWeb.PerformerControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Registration

  @create_attrs %{
    name: "some name",
    paragraph1: "some paragraph 1",
    paragraph2: "some paragraph 2",
    paragraph3: "some paragraph 3",
    paragraph4: "some paragraph 4",
    paragraph5: "some paragraph 5",
    link: "some link",
    photo_path: "some photo path",
    confirmed: false
  }

  @update_attrs %{
    name: "some updated name",
    paragraph1: "some updated paragraph 1",
    paragraph2: "some updated paragraph 2",
    paragraph3: "some updated paragraph 3",
    paragraph4: "some updated paragraph 4",
    paragraph5: "some updated paragraph 5",
    link: "some updated link",
    photo_path: "some updated photo path",
    confirmed: true
  }

  @invalid_attrs %{
    name: nil,
    paragraph1: nil,
    paragraph2: nil,
    paragraph3: nil,
    paragraph4: nil,
    paragraph5: nil,
    link: nil,
    photo_path: nil,
    confirmed: nil
  }

  def fixture(:performer) do
    {:ok, performer} = Registration.create_performer(@create_attrs)
    performer
  end

  describe "index" do
    test "lists all performers", %{conn: conn} do
      conn = get(conn, Routes.performer_path(conn, :index))
      assert html_response(conn, 200) =~ "Esiintyjät"
    end
  end

  describe "new performer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_performer_path(conn, :new))
      assert html_response(conn, 200) =~ "Luo esiintyjä"
    end
  end

  describe "create performer" do
    # TODO handle photo field
    @describetag :skip
    test "redirects to admin when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_performer_path(conn, :create), performer: @create_attrs)

      assert redirected_to(conn) == Routes.admin_performer_path(conn, :admin)

      conn = get(conn, Routes.admin_performer_path(conn, :admin))
      assert html_response(conn, 200) =~ "HALLINTA - Esiintyjät"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_performer_path(conn, :create), performer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Luo esiintyjä"
    end
  end

  describe "edit performer" do
    setup [:create_performer]

    test "renders form for editing chosen performer", %{conn: conn, performer: performer} do
      conn = get(conn, Routes.admin_performer_path(conn, :edit, performer))
      assert html_response(conn, 200) =~ "Muokkaa esiintyjän tietoja"
    end
  end

  describe "update performer" do
    setup [:create_performer]

    test "redirects to admin when data is valid", %{conn: conn, performer: performer} do
      conn =
        put(conn, Routes.admin_performer_path(conn, :update, performer), performer: @update_attrs)

      assert redirected_to(conn) == Routes.admin_performer_path(conn, :admin)

      conn = get(conn, Routes.admin_performer_path(conn, :admin))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, performer: performer} do
      conn =
        put(conn, Routes.admin_performer_path(conn, :update, performer), performer: @invalid_attrs)

      assert html_response(conn, 200) =~ "Muokkaa esiintyjän tietoja"
    end
  end

  describe "delete performer" do
    setup [:create_performer]

    test "deletes chosen performer", %{conn: conn, performer: performer} do
      conn = delete(conn, Routes.admin_performer_path(conn, :delete, performer))
      assert redirected_to(conn) == Routes.admin_performer_path(conn, :admin)

      assert_error_sent 404, fn ->
        get(conn, Routes.performer_path(conn, :show, performer))
      end
    end
  end

  defp create_performer(_) do
    performer = fixture(:performer)
    %{performer: performer}
  end
end
