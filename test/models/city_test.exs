defmodule BoleteraApi.CityTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.City

  @valid_attrs %{active: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = City.changeset(%City{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = City.changeset(%City{}, @invalid_attrs)
    refute changeset.valid?
  end
end
