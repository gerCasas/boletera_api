defmodule BoleteraApi.EventController do
  use BoleteraApi.Web, :controller
  use Timex

  alias BoleteraApi.Event
  # alias BoleteraApi.QueryFilter

  def index(conn, _params) do

    # current_datetime
    current_datetime =
      DateTime.utc_now
      |> DateTime.to_iso8601

    IO.puts("+++")
    IO.puts("+++")
    datetime = Timex.now
    IO.inspect(datetime)
    IO.inspect(current_datetime)


    query = from u in Event, where: u.active == 1 and u.event_date >= ^"2017-07-30T12:00:00"
    events = Repo.all(query)

# , p.event_date >=
    # agregar para que tambien se pueda filtrar por fecha del evento mayor a la actual...
    # checar como se hacer los querys dinamicos.

    render(conn, "index.json", events: events)
  end

  # def index(conn, params) do
  #
  #   # IO.puts("+++")
  #   # # IO.inspect(params)
  #   # IO.puts(params["gt_event_date"])
  #   # IO.puts("+++")
  #   # value = params["gt_event_date"]
  #   # if value do
  #   #     IO.puts("+++")
  #   #     IO.puts(value)
  #   #     IO.puts("+++")
  #   #   else
  #   #     IO.puts("+++")
  #   #     IO.puts("NOOOOOO")
  #   #     IO.puts("+++")
  #   # end
  #
  #   # case params["gt_event_date"] do
  #   #   nil ->
  #   #
  #   #   value ->
  #   #
  #   # end
  #
  #   # value = params["gt_event_date"]
  #   # if value do
  #   #   query = from u in Event, where: u.event_date >= ^value
  #   #   events = Repo.all(query)
  #   # else
  #   #   events =
  #   #     Event
  #   #     |> QueryFilter.filter(%Event{}, params, [:name, :description, :image_path, :seats, :event_date, :price, :active, :city_id, :id])
  #   #     |> Repo.all
  #   # end
  #   events =
  #   case params["gt_event_date"] do
  #     nil ->
  #       Event
  #       |> QueryFilter.filter(%Event{}, params, [:name, :description, :image_path, :seats, :event_date, :price, :active, :city_id, :id])
  #       |> Repo.all
  #     value ->
  #       query = from u in Event, where: u.event_date >= ^value
  #       Repo.all(query)
  #   end
  #
  #
  #   # events =
  #   #   Event
  #   #   |> QueryFilter.filter(%Event{}, params, [:name, :description, :image_path, :seats, :event_date, :price, :active, :city_id, :id])
  #   #   |> Repo.all
  #
  #   render(conn, "index.json", events: events)
  # end

  # def index(conn, _params) do
  #   events = Repo.all(Event)
  #   render(conn, "index.json", events: events)
  # end

  def create(conn, %{"event" => event_params}) do
    changeset = Event.changeset(%Event{}, event_params)

    case Repo.insert(changeset) do
      {:ok, event} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", event_path(conn, :show, event))
        |> render("show.json", event: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    render(conn, "show.json", event: event)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Repo.get!(Event, id)
    changeset = Event.changeset(event, event_params)

    case Repo.update(changeset) do
      {:ok, event} ->
        render(conn, "show.json", event: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(event)

    send_resp(conn, :no_content, "")
  end
end
