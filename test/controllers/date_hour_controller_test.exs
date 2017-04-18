defmodule BoleteraApi.DateHourControllerTest do
  use BoleteraApi.ConnCase

  alias BoleteraApi.DateHour
  @valid_attrs %{date_hour: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, date_hour_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    date_hour = Repo.insert! %DateHour{}
    conn = get conn, date_hour_path(conn, :show, date_hour)
    assert json_response(conn, 200)["data"] == %{"id" => date_hour.id,
      "date_hour" => date_hour.date_hour,
      "show_date_id" => date_hour.show_date_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, date_hour_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, date_hour_path(conn, :create), date_hour: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(DateHour, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, date_hour_path(conn, :create), date_hour: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    date_hour = Repo.insert! %DateHour{}
    conn = put conn, date_hour_path(conn, :update, date_hour), date_hour: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(DateHour, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    date_hour = Repo.insert! %DateHour{}
    conn = put conn, date_hour_path(conn, :update, date_hour), date_hour: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    date_hour = Repo.insert! %DateHour{}
    conn = delete conn, date_hour_path(conn, :delete, date_hour)
    assert response(conn, 204)
    refute Repo.get(DateHour, date_hour.id)
  end
end
