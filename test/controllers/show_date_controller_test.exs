defmodule BoleteraApi.ShowDateControllerTest do
  use BoleteraApi.ConnCase

  alias BoleteraApi.ShowDate
  @valid_attrs %{show_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, show_date_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    show_date = Repo.insert! %ShowDate{}
    conn = get conn, show_date_path(conn, :show, show_date)
    assert json_response(conn, 200)["data"] == %{"id" => show_date.id,
      "show_date" => show_date.show_date,
      "event_id" => show_date.event_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, show_date_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, show_date_path(conn, :create), show_date: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ShowDate, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, show_date_path(conn, :create), show_date: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    show_date = Repo.insert! %ShowDate{}
    conn = put conn, show_date_path(conn, :update, show_date), show_date: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ShowDate, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    show_date = Repo.insert! %ShowDate{}
    conn = put conn, show_date_path(conn, :update, show_date), show_date: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    show_date = Repo.insert! %ShowDate{}
    conn = delete conn, show_date_path(conn, :delete, show_date)
    assert response(conn, 204)
    refute Repo.get(ShowDate, show_date.id)
  end
end
