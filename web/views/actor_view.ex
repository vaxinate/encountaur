defmodule Encountaur.ActorView do
  use Encountaur.Web, :view

  def render("index.json", %{actors: actors}) do
    %{data: render_many(actors, Encountaur.ActorView, "actor.json")}
  end

  def render("show.json", %{actor: actor}) do
    %{data: render_one(actor, Encountaur.ActorView, "actor.json")}
  end

  def render("actor.json", %{actor: actor}) do
    %{id: actor.id,
      name: actor.name,
      hp: actor.hp}
  end
end
