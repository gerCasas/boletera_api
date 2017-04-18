defmodule BoleteraApi.ShowDateTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.ShowDate

  @valid_attrs %{show_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ShowDate.changeset(%ShowDate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ShowDate.changeset(%ShowDate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
