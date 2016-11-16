defmodule Encountaur.Api.EncounterView do
  use PhoenixEncounterThing.Web, :view

  def render("index.json", %{encounters: encounters}) do
    %{data: render_many(encounters, PhoenixEncounterThing.Api.EncounterView, "encounter.json")}
  end

  def render("show.json", %{encounter: encounter}) do
    %{data: render_one(encounter, PhoenixEncounterThing.Api.EncounterView, "encounter.json")}
  end

  def render("encounter.json", %{encounter: encounter}) do
    %{id: encounter.id}
  end
end
