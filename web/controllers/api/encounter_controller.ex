defmodule Encountaur.Api.EncounterController do
  use Encountaur.Web, :controller

  alias Encountaur.Encounter

  def index(conn, _params) do
    encounters = Repo.all(Encounter)
    render(conn, "index.json", encounters: encounters)
  end

  def create(conn, %{"encounter" => encounter_params}) do
    changeset = Encounter.changeset(%Encounter{}, encounter_params)

    case Repo.insert(changeset) do
      {:ok, encounter} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", encounter_path(conn, :show, encounter))
        |> render("show.json", encounter: encounter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Encountaur.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    encounter = Repo.get!(Encounter, id)
    |> Repo.preload(:actors)
    render(conn, "show.json", encounter: encounter)
  end

  def update(conn, %{"id" => id, "encounter" => encounter_params}) do
    encounter = Repo.get!(Encounter, id)
    changeset = Encounter.changeset(encounter, encounter_params)

    case Repo.update(changeset) do
      {:ok, encounter} ->
        render(conn, "show.json", encounter: encounter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Encountaur.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    encounter = Repo.get!(Encounter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(encounter)

    send_resp(conn, :no_content, "")
  end
end
