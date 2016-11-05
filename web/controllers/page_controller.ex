defmodule PhoenixEncounterThing.PageController do
  use PhoenixEncounterThing.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
