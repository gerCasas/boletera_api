defmodule BoleteraApi.CategoryTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.Category

  @valid_attrs %{active: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Category.changeset(%Category{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Category.changeset(%Category{}, @invalid_attrs)
    refute changeset.valid?
  end
end
