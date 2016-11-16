defmodule Encountaur.EncounterControllerTest do
  use Encountaur.ConnCase

  alias Encountaur.Encounter
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, encounter_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = get conn, encounter_path(conn, :show, encounter)
    assert json_response(conn, 200)["data"] == %{"id" => encounter.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, encounter_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, encounter_path(conn, :create), encounter: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Encounter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, encounter_path(conn, :create), encounter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = put conn, encounter_path(conn, :update, encounter), encounter: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Encounter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = put conn, encounter_path(conn, :update, encounter), encounter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = delete conn, encounter_path(conn, :delete, encounter)
    assert response(conn, 204)
    refute Repo.get(Encounter, encounter.id)
  end
end
