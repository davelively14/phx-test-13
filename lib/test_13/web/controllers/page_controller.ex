defmodule Test13.Web.PageController do
  use Test13.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
