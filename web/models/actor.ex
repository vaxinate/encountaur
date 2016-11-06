defmodule PhoenixEncounterThing.Actor do
  use PhoenixEncounterThing.Web, :model

  schema "actors" do
    field :name, :string
    field :hp, :integer
    belongs_to :encounter, PhoenixEncounterThing.Encounter

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:name, :hp, :encounter_id])
    |> validate_required([:name, :hp, :encounter_id])
  end
end
