defmodule RunosaariWeb.PageController do
  use RunosaariWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
