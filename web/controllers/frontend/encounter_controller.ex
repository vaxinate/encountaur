defmodule Encountaur.Frontend.EncounterController do
  use Encountaur.Web, :controller

  def index(conn, _params) do
    encounters = Repo.all(Encountaur.Encounter)
    render conn, "index.html", encounters: encounters
  end

  def show(conn, %{"id" => id}) do
    encounter = Repo.get(Encountaur.Encounter, id)
    render conn, "show.html", encounter: encounter
  end
end
