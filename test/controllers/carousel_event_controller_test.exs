defmodule BoleteraApi.CarouselEventControllerTest do
  use BoleteraApi.ConnCase

  alias BoleteraApi.CarouselEvent
  @valid_attrs %{active: 42, image_path: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, carousel_event_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    carousel_event = Repo.insert! %CarouselEvent{}
    conn = get conn, carousel_event_path(conn, :show, carousel_event)
    assert json_response(conn, 200)["data"] == %{"id" => carousel_event.id,
      "image_path" => carousel_event.image_path,
      "event_id" => carousel_event.event_id,
      "active" => carousel_event.active}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, carousel_event_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, carousel_event_path(conn, :create), carousel_event: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(CarouselEvent, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, carousel_event_path(conn, :create), carousel_event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    carousel_event = Repo.insert! %CarouselEvent{}
    conn = put conn, carousel_event_path(conn, :update, carousel_event), carousel_event: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(CarouselEvent, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    carousel_event = Repo.insert! %CarouselEvent{}
    conn = put conn, carousel_event_path(conn, :update, carousel_event), carousel_event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    carousel_event = Repo.insert! %CarouselEvent{}
    conn = delete conn, carousel_event_path(conn, :delete, carousel_event)
    assert response(conn, 204)
    refute Repo.get(CarouselEvent, carousel_event.id)
  end
end
