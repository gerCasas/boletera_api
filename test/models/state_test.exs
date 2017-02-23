defmodule BoleteraApi.StateTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.State

  @valid_attrs %{active: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = State.changeset(%State{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = State.changeset(%State{}, @invalid_attrs)
    refute changeset.valid?
  end
end
