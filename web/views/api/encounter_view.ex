defmodule Encountaur.Api.EncounterView do
  use Encountaur.Web, :view

  def render("index.json", %{encounters: encounters}) do
    %{data: render_many(encounters, Encountaur.Api.EncounterView, "encounter.json")}
  end

  def render("show.json", %{encounter: encounter}) do
    %{data: render_one(encounter, Encountaur.Api.EncounterView, "encounter.json")}
  end

  def render("encounter.json", %{encounter: encounter}) do
    %{id: encounter.id,
      name: encounter.name,
      actors: render_many(encounter.actors, Encountaur.Api.ActorView, "actor.json")}
  end
end
