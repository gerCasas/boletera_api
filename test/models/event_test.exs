defmodule BoleteraApi.EventTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.Event

  @valid_attrs %{active: 42, event_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, name: "some content", price: "120.5", seats: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
