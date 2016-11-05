defmodule PhoenixEncounterThing.Encounter do
  use PhoenixEncounterThing.Web, :model

  schema "encounters" do
    field :name, :string

    timestamps
  end

end
