defmodule RunosaariWeb.PageControllerTest do
  use RunosaariWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Runosaari 2021"
  end
end
