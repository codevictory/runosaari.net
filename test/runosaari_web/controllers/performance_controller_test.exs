defmodule RunosaariWeb.PerformanceControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Schedule

  @create_attrs %{
    name: "some name",
    desc: "some description",
    seqnum: 1
  }

  @update_attrs %{
    name: "some updated name",
    desc: "some updated description",
    seqnum: 2
  }

  @invalid_attrs %{name: nil, desc: nil, seqnum: nil}

  def fixture(:performance) do
    {:ok, performance} = Schedule.create_performance(@create_attrs)
    performance
  end

  describe "index" do
    test "lists all performances", %{conn: conn} do
      conn = get(conn, Routes.performance_path(conn, :index))
      assert html_response(conn, 200) =~ "Ohjelma"
    end
  end

  describe "new performance" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_performance_path(conn, :new))
      assert html_response(conn, 200) =~ "Luo näytös"
    end
  end

  describe "create performance" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_performance_path(conn, :create), performance: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_performance_path(conn, :show, id)

      conn = get(conn, Routes.admin_performance_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Näytös"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_performance_path(conn, :create), performance: @invalid_attrs)
      assert html_response(conn, 200) =~ "Luo näytös"
    end
  end

  describe "edit performance" do
    setup [:create_performance]

    test "renders form for editing chosen performance", %{conn: conn, performance: performance} do
      conn = get(conn, Routes.admin_performance_path(conn, :edit, performance))
      assert html_response(conn, 200) =~ "Muokkaa näytöksen tietoja"
    end
  end

  describe "update performance" do
    setup [:create_performance]

    test "redirects when data is valid", %{conn: conn, performance: performance} do
      conn =
        put(conn, Routes.admin_performance_path(conn, :update, performance),
          performance: @update_attrs
        )

      assert redirected_to(conn) == Routes.admin_performance_path(conn, :show, performance)

      conn = get(conn, Routes.admin_performance_path(conn, :show, performance))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, performance: performance} do
      conn =
        put(conn, Routes.admin_performance_path(conn, :update, performance),
          performance: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Muokkaa näytöksen tietoja"
    end
  end

  describe "delete performance" do
    setup [:create_performance]

    test "deletes chosen performance", %{conn: conn, performance: performance} do
      conn = delete(conn, Routes.admin_performance_path(conn, :delete, performance))
      assert redirected_to(conn) == Routes.admin_performance_path(conn, :admin)

      assert_error_sent 404, fn ->
        get(conn, Routes.admin_performance_path(conn, :show, performance))
      end
    end
  end

  defp create_performance(_) do
    performance = fixture(:performance)
    %{performance: performance}
  end
end
