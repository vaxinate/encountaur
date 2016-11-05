defmodule PhoenixEncounterThing.EncounterController do
  use PhoenixEncounterThing.Web, :controller

  def index(conn, _params) do
    encounters = Repo.all(PhoenixEncounterThing.Encounter)
    render conn, "index.html", encounters: encounters
  end

  def show(conn, %{"id" => id}) do
    encounter = Repo.get(PhoenixEncounterThing.Encounter, id)
    render conn, "show.html", encounter: encounter
  end
end
