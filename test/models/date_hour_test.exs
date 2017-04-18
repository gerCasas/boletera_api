defmodule BoleteraApi.DateHourTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.DateHour

  @valid_attrs %{date_hour: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DateHour.changeset(%DateHour{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DateHour.changeset(%DateHour{}, @invalid_attrs)
    refute changeset.valid?
  end
end
