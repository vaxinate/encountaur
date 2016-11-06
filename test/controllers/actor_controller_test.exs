defmodule Encountaur.ActorControllerTest do
  use Encountaur.ConnCase

  alias Encountaur.Actor
  @valid_attrs %{hp: 42, name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, actor_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = get conn, actor_path(conn, :show, actor)
    assert json_response(conn, 200)["data"] == %{"id" => actor.id,
      "name" => actor.name,
      "hp" => actor.hp}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, actor_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, actor_path(conn, :create), actor: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Actor, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, actor_path(conn, :create), actor: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = put conn, actor_path(conn, :update, actor), actor: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Actor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = put conn, actor_path(conn, :update, actor), actor: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = delete conn, actor_path(conn, :delete, actor)
    assert response(conn, 204)
    refute Repo.get(Actor, actor.id)
  end
end
