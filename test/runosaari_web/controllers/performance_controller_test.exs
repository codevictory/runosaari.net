defmodule RunosaariWeb.PerformanceControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Schedule

  @create_attrs %{
    name: "some name",
    paragraph1: "some paragraph1",
    paragraph2: "some paragraph2",
    paragraph3: "some paragraph3",
    paragraph4: "some paragraph4",
    paragraph5: "some paragraph5",
    paragraph6: "some paragraph6",
    paragraph7: "some paragraph7",
    paragraph8: "some paragraph8",
    paragraph9: "some paragraph9",
    seqnum: 1
  }

  @update_attrs %{
    name: "some updated name",
    paragraph1: "some updated paragraph1",
    paragraph2: "some updated paragraph2",
    paragraph3: "some updated paragraph3",
    paragraph4: "some updated paragraph4",
    paragraph5: "some updated paragraph5",
    paragraph6: "some updated paragraph6",
    paragraph7: "some updated paragraph7",
    paragraph8: "some updated paragraph8",
    paragraph9: "some updated paragraph9",
    seqnum: 2
  }

  @invalid_attrs %{
    name: nil,
    paragraph1: nil,
    paragraph2: nil,
    paragraph3: nil,
    paragraph4: nil,
    paragraph5: nil,
    paragraph6: nil,
    paragraph7: nil,
    paragraph8: nil,
    paragraph9: nil,
    seqnum: nil
  }

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
      assert html_response(conn, 200) =~ "some updated paragraph1"
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
