defmodule Encountaur.PageController do
  use Encountaur.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
