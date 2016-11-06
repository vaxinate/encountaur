defmodule PhoenixEncounterThing.ActorController do
  use PhoenixEncounterThing.Web, :controller

  alias PhoenixEncounterThing.Actor

  def create(conn, %{"actor" => actor_params}) do
    changeset = Actor.changeset(%Actor{}, actor_params)

    case Repo.insert(changeset) do
      {:ok, actor} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", actor_path(conn, :show, actor))
        |> render("show.json", actor: actor)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixEncounterThing.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    actor = Repo.get!(Actor, id)
    render(conn, "show.json", actor: actor)
  end

  def update(conn, %{"id" => id, "actor" => actor_params}) do
    actor = Repo.get!(Actor, id)
    changeset = Actor.changeset(actor, actor_params)

    case Repo.update(changeset) do
      {:ok, actor} ->
        render(conn, "show.json", actor: actor)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixEncounterThing.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    actor = Repo.get!(Actor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(actor)

    send_resp(conn, :no_content, "")
  end
end
