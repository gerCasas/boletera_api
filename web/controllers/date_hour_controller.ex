defmodule BoleteraApi.DateHourController do
  use BoleteraApi.Web, :controller

  alias BoleteraApi.DateHour

  def index(conn, _params) do
    datehours = Repo.all(DateHour)
    render(conn, "index.json", datehours: datehours)
  end

  def create(conn, %{"date_hour" => date_hour_params}) do
    changeset = DateHour.changeset(%DateHour{}, date_hour_params)

    case Repo.insert(changeset) do
      {:ok, date_hour} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", date_hour_path(conn, :show, date_hour))
        |> render("show.json", date_hour: date_hour)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    date_hour = Repo.get!(DateHour, id)
    render(conn, "show.json", date_hour: date_hour)
  end

  def update(conn, %{"id" => id, "date_hour" => date_hour_params}) do
    date_hour = Repo.get!(DateHour, id)
    changeset = DateHour.changeset(date_hour, date_hour_params)

    case Repo.update(changeset) do
      {:ok, date_hour} ->
        render(conn, "show.json", date_hour: date_hour)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    date_hour = Repo.get!(DateHour, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(date_hour)

    send_resp(conn, :no_content, "")
  end
end
