defmodule RunosaariWeb.SurvivalControllerTest do
  use RunosaariWeb.ConnCase

  alias Runosaari.Pages

  @create_attrs %{content: "some content", seqnum: 42, link: "some link"}
  @update_attrs %{content: "some updated content", seqnum: 43, link: "some updated link"}
  @invalid_attrs %{content: nil, seqnum: nil, link: nil}

  def fixture(:survival) do
    {:ok, survival} = Pages.create_survival(@create_attrs)
    survival
  end

  describe "admin" do
    test "lists all survival_items", %{conn: conn} do
      conn = get(conn, Routes.admin_survival_path(conn, :admin))
      assert html_response(conn, 200) =~ "HALLINTA - Survival listan kohdat"
    end
  end

  describe "new survival" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_survival_path(conn, :new))
      assert html_response(conn, 200) =~ "Uusi survival listan kohta"
    end
  end

  describe "create survival" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_survival_path(conn, :create), survival: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_survival_path(conn, :show, id)

      conn = get(conn, Routes.admin_survival_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Survival listan kohdan tiedot"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_survival_path(conn, :create), survival: @invalid_attrs)
      assert html_response(conn, 200) =~ "Uusi survival listan kohta"
    end
  end

  describe "edit survival" do
    setup [:create_survival]

    test "renders form for editing chosen survival", %{conn: conn, survival: survival} do
      conn = get(conn, Routes.admin_survival_path(conn, :edit, survival))
      assert html_response(conn, 200) =~ "Muokkaa survival listan kohtaa"
    end
  end

  describe "update survival" do
    setup [:create_survival]

    test "redirects when data is valid", %{conn: conn, survival: survival} do
      conn =
        put(conn, Routes.admin_survival_path(conn, :update, survival), survival: @update_attrs)

      assert redirected_to(conn) == Routes.admin_survival_path(conn, :show, survival)

      conn = get(conn, Routes.admin_survival_path(conn, :show, survival))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, survival: survival} do
      conn =
        put(conn, Routes.admin_survival_path(conn, :update, survival), survival: @invalid_attrs)

      assert html_response(conn, 200) =~ "Muokkaa survival listan kohtaa"
    end
  end

  describe "delete survival" do
    setup [:create_survival]

    test "deletes chosen survival", %{conn: conn, survival: survival} do
      conn = delete(conn, Routes.admin_survival_path(conn, :delete, survival))
      assert redirected_to(conn) == Routes.admin_survival_path(conn, :admin)

      assert_error_sent 404, fn ->
        get(conn, Routes.admin_survival_path(conn, :show, survival))
      end
    end
  end

  defp create_survival(_) do
    survival = fixture(:survival)
    %{survival: survival}
  end
end
