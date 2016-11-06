defmodule Encountaur.ActorTest do
  use Encountaur.ModelCase

  alias Encountaur.Actor

  @valid_attrs %{hp: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Actor.changeset(%Actor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Actor.changeset(%Actor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
