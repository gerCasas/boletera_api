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
        query = from show_date in ShowDate,
        where: show_date.event_id == ^value,
        order_by: show_date.show_date
        Repo.all(query)
    end

    case params["event_id"] do
      nil ->
        json_to_render = "index.json"

      value ->
        json_to_render = "dates_formatted.json"

        showdates = Enum.map(showdates, fn x ->
          query = from date_hour in DateHour,
          where: date_hour.show_date_id == ^x.id
          query = Repo.all(query)
          # IO.puts("@@@@@@@@@@@@@@@@@@@@")
          x = Map.put_new(x, :date_hours, query)
          # IO.inspect(x)
          # IO.puts("@@@@@@@@@@@@@@@@@@@@")
        end)
        # IO.puts("@-@-@-@-@-@-@-@-@-@-@-@-@-@")
        # IO.inspect(showdates)
        IO.puts("@-@-@-@-@-@-@-@-@-@-@-@-@-@")
    end


    # query = from date_hour in DateHour,
    # where: date_hour.show_date_id == ^show_date.id,
    # order_by: date_hour.date_hour
    # Repo.all(query)
    #
    # IO.puts("@@@@@@@@@@@@@@@@@@@@")
    # IO.inspect(query)
    # IO.puts("@@@@@@@@@@@@@@@@@@@@")

    render(conn, json_to_render, showdates: showdates)
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
