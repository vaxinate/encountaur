defmodule Encountaur.Repo.Migrations.CreateEncounter do
  use Ecto.Migration

  def change do
    create table(:encounters) do
      add :name, :string
      
      timestamps
    end

  end
end
