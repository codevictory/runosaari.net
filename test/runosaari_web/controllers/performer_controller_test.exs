defmodule RunosaariWeb.PerformerControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Registration

  @create_attrs %{
    confirmed: true,
    email: "some email",
    fname: "some fname",
    lname: "some lname",
    tel: "some tel",
    desc: "some desc",
    date1: true,
    date2: true,
    date3: true,
    bus: true,
    accom: true
  }
  @update_attrs %{
    confirmed: false,
    email: "some updated email",
    fname: "some updated fname",
    lname: "some updated lname",
    tel: "some updated tel",
    desc: "some updated desc",
    date1: true,
    date2: true,
    date3: true,
    bus: true,
    accom: true
  }

  @invalid_attrs %{
    confirmed: nil,
    email: nil,
    fname: nil,
    lname: nil,
    tel: nil,
    desc: nil,
    date1: nil,
    date2: nil,
    date3: nil,
    bus: nil,
    accom: nil
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
      assert html_response(conn, 200) =~ "Ilmoittaudu"
    end
  end

  describe "create performer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_performer_path(conn, :create), performer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.performer_path(conn, :show, id)

      conn = get(conn, Routes.performer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Esiintyjän tiedot"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_performer_path(conn, :create), performer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Ilmoittaudu"
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

    test "redirects when data is valid", %{conn: conn, performer: performer} do
      conn =
        put(conn, Routes.admin_performer_path(conn, :update, performer), performer: @update_attrs)

      assert redirected_to(conn) == Routes.performer_path(conn, :show, performer)

      conn = get(conn, Routes.performer_path(conn, :show, performer))
      assert html_response(conn, 200) =~ "some updated email"
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
