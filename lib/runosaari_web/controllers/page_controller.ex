defmodule RunosaariWeb.PageController do
  use RunosaariWeb, :controller

  def safety(conn, _params) do
    render(conn, "safety.html")
  end

  def privacy(conn, _params) do
    render(conn, "privacy.html")
  end
end
