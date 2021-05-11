defmodule RunosaariWeb.PageController do
  use RunosaariWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def info(conn, _params) do
    render(conn, "info.html")
  end

  def covid19(conn, _params) do
    render(conn, "covid19.html")
  end

  def privacy(conn, _params) do
    render(conn, "privacy.html")
  end
end
