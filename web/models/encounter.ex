defmodule Encountaur.Encounter do
  use Encountaur.Web, :model

  schema "encounters" do
    field :name, :string
    has_many :actors, Encountaur.Actor

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:name])
    |> validate_required([:name])
  end

end
