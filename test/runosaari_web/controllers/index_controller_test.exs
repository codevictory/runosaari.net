defmodule RunosaariWeb.IndexControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Pages

  @create_attrs %{content: "some content", seqnum: 42}
  @update_attrs %{content: "some updated content", seqnum: 43}
  @invalid_attrs %{content: nil, seqnum: nil}

  def fixture(:index) do
    {:ok, index} = Pages.create_index(@create_attrs)
    index
  end

  describe "index" do
    test "lists all index_paragraphs", %{conn: conn} do
      conn = get(conn, Routes.index_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Index paragraphs"
    end
  end

  describe "new index" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_index_path(conn, :new))
      assert html_response(conn, 200) =~ "New Index"
    end
  end

  describe "create index" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_index_path(conn, :create), index: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_index_path(conn, :show, id)

      conn = get(conn, Routes.admin_index_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Index"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_index_path(conn, :create), index: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Index"
    end
  end

  describe "edit index" do
    setup [:create_index]

    test "renders form for editing chosen index", %{conn: conn, index: index} do
      conn = get(conn, Routes.admin_index_path(conn, :edit, index))
      assert html_response(conn, 200) =~ "Edit Index"
    end
  end

  describe "update index" do
    setup [:create_index]

    test "redirects when data is valid", %{conn: conn, index: index} do
      conn = put(conn, Routes.admin_index_path(conn, :update, index), index: @update_attrs)
      assert redirected_to(conn) == Routes.admin_index_path(conn, :show, index)

      conn = get(conn, Routes.admin_index_path(conn, :show, index))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, index: index} do
      conn = put(conn, Routes.admin_index_path(conn, :update, index), index: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Index"
    end
  end

  describe "delete index" do
    setup [:create_index]

    test "deletes chosen index", %{conn: conn, index: index} do
      conn = delete(conn, Routes.admin_index_path(conn, :delete, index))
      assert redirected_to(conn) == Routes.index_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.admin_index_path(conn, :show, index))
      end
    end
  end

  defp create_index(_) do
    index = fixture(:index)
    %{index: index}
  end
end
