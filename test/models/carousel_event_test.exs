defmodule BoleteraApi.CarouselEventTest do
  use BoleteraApi.ModelCase

  alias BoleteraApi.CarouselEvent

  @valid_attrs %{active: 42, image_path: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CarouselEvent.changeset(%CarouselEvent{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CarouselEvent.changeset(%CarouselEvent{}, @invalid_attrs)
    refute changeset.valid?
  end
end
