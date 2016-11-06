defmodule Encountaur.Repo.Migrations.CreateActor do
  use Ecto.Migration

  def change do
    create table(:actors) do
      add :name, :string
      add :hp, :integer
      add :encounter_id, references(:encounters, on_delete: :delete_all)

      timestamps()
    end

    create index(:actors, [:encounter_id])
  end
end
