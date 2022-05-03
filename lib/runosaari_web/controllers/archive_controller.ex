defmodule RunosaariWeb.ArchiveController do
  use RunosaariWeb, :controller

  alias Runosaari.Registration

  def index(conn, _params) do
    performers2021 = Registration.list_sorted_archived_performers(2021)
    render(conn, "index.html", performers2021: performers2021)
  end
end
