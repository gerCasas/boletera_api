defmodule BoleteraApi.ShowDateController do
  use BoleteraApi.Web, :controller

  alias BoleteraApi.ShowDate
  alias BoleteraApi.DateHour

  def index(conn, params) do

    showdates =
    case params["event_id"] do
      nil ->
        json_to_render = "index.json"
        Repo.all(ShowDate)
      value ->
        json_to_render = "dates_formatted.json"
        query = from show_date in ShowDate, join: date_hour in DateHour,
        where: date_hour.show_date_id == show_date.id
        and show_date.event_id == ^value,
        select:
        %{id: show_date.id,
          show_date: show_date.show_date,
          event_id: show_date.event_id,
          date_hours_id: date_hour.id,
          date_hour: date_hour.date_hour
        }, order_by: show_date.show_date
        generate_formated_datetimes(Repo.all(query))
    end

    render(conn, json_to_render, showdates: showdates)
  end

  def generate_formated_datetimes(input) do
    uniq_dates = Enum.map(input, &get_show_dates/1) |> Enum.uniq
    uniq_hours = Enum.map(input, &get_dates_hours/1) |> Enum.uniq
    combine_date_and_hours(uniq_dates, uniq_hours)
  end

  def get_show_dates(input) do
    %{id: input.id, event_id: input.event_id, show_date: input.show_date}
  end

  def get_dates_hours(input) do
    %{show_date_id: input.id, date_hours_id: input.date_hours_id, date_hour: input.date_hour}
  end

  def combine_date_and_hours(dates, hours) do
    Enum.map(dates, fn date ->
        hours_by_date =
          Enum.filter(hours, fn(hour) ->
            if hour.show_date_id == date.id do
              true
            else
              false
            end
          end)
        Map.put_new(date, :date_hours, hours_by_date)
      end)
  end

  def create(conn, %{"show_date" => show_date_params}) do
    changeset = ShowDate.changeset(%ShowDate{}, show_date_params)

    case Repo.insert(changeset) do
      {:ok, show_date} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", show_date_path(conn, :show, show_date))
        |> render("show.json", show_date: show_date)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    show_date = Repo.get!(ShowDate, id)
    render(conn, "show.json", show_date: show_date)
  end

  def update(conn, %{"id" => id, "show_date" => show_date_params}) do
    show_date = Repo.get!(ShowDate, id)
    changeset = ShowDate.changeset(show_date, show_date_params)

    case Repo.update(changeset) do
      {:ok, show_date} ->
        render(conn, "show.json", show_date: show_date)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    show_date = Repo.get!(ShowDate, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(show_date)

    send_resp(conn, :no_content, "")
  end
end
