defmodule RunosaariWeb.VisitorControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Registration

  @create_attrs %{
    accom: true,
    bus: true,
    date1: true,
    date2: true,
    date3: true,
    email: "some email",
    fname: "some fname",
    lname: "some lname",
    tel: "some tel"
  }
  @update_attrs %{
    accom: false,
    bus: false,
    date1: false,
    date2: false,
    date3: false,
    email: "some updated email",
    fname: "some updated fname",
    lname: "some updated lname",
    tel: "some updated tel"
  }
  @invalid_attrs %{
    accom: nil,
    bus: nil,
    date1: nil,
    date2: nil,
    date3: nil,
    email: nil,
    fname: nil,
    lname: nil,
    tel: nil
  }

  def fixture(:visitor) do
    {:ok, visitor} = Registration.create_visitor(@create_attrs)
    visitor
  end

  describe "index" do
    test "lists all visitors", %{conn: conn} do
      conn = get(conn, Routes.visitor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Visitors"
    end
  end

  describe "new visitor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.visitor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Visitor"
    end
  end

  describe "create visitor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.visitor_path(conn, :create), visitor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.visitor_path(conn, :show, id)

      conn = get(conn, Routes.visitor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Visitor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.visitor_path(conn, :create), visitor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Visitor"
    end
  end

  describe "edit visitor" do
    setup [:create_visitor]

    test "renders form for editing chosen visitor", %{conn: conn, visitor: visitor} do
      conn = get(conn, Routes.visitor_path(conn, :edit, visitor))
      assert html_response(conn, 200) =~ "Edit Visitor"
    end
  end

  describe "update visitor" do
    setup [:create_visitor]

    test "redirects when data is valid", %{conn: conn, visitor: visitor} do
      conn = put(conn, Routes.visitor_path(conn, :update, visitor), visitor: @update_attrs)

      assert redirected_to(conn) == Routes.visitor_path(conn, :show, visitor)

      conn = get(conn, Routes.visitor_path(conn, :show, visitor))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, visitor: visitor} do
      conn = put(conn, Routes.visitor_path(conn, :update, visitor), visitor: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Visitor"
    end
  end

  describe "delete visitor" do
    setup [:create_visitor]

    test "deletes chosen visitor", %{conn: conn, visitor: visitor} do
      conn = delete(conn, Routes.visitor_path(conn, :delete, visitor))
      assert redirected_to(conn) == Routes.visitor_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.visitor_path(conn, :show, visitor))
      end
    end
  end

  defp create_visitor(_) do
    visitor = fixture(:visitor)
    %{visitor: visitor}
  end
end
