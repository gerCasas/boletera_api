defmodule BoleteraApi.Event_PhotoTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.Event_Photo

  @valid_attrs %{active: 42, image_path: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event_Photo.changeset(%Event_Photo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event_Photo.changeset(%Event_Photo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
