defmodule BoleteraApi.EventController do
  use BoleteraApi.Web, :controller
  use Timex

  alias BoleteraApi.Event
  # alias BoleteraApi.QueryFilter

#   def index(conn, _params) do
#
#     # datetime = Timex.format!(Timex.local, "{ISO:Extended:Z}")
#     datetime = Timex.now("America/Tijuana")
#     query = from u in Event, where: u.active == 1 and u.event_date >= ^datetime, order_by: u.inserted_at
#     events = Repo.all(query)
# # , p.event_date >=
#     # agregar para que tambien se pueda filtrar por fecha del evento mayor a la actual...
#     # checar como se hacer los querys dinamicos.
#
#     render(conn, "index.json", events: events)
#   end

  def index(conn, params) do

    # IO.puts("+++")
    # # IO.inspect(params)
    # IO.puts(params["gt_event_date"])
    # IO.puts("+++")
    # value = params["gt_event_date"]
    # if value do
    #     IO.puts("+++")
    #     IO.puts(value)
    #     IO.puts("+++")
    #   else
    #     IO.puts("+++")
    #     IO.puts("NOOOOOO")
    #     IO.puts("+++")
    # end

    # case params["gt_event_date"] do
    #   nil ->
    #
    #   value ->
    #
    # end

    # value = params["gt_event_date"]
    # if value do
    #   query = from u in Event, where: u.event_date >= ^value
    #   events = Repo.all(query)
    # else
    #   events =
    #     Event
    #     |> QueryFilter.filter(%Event{}, params, [:name, :description, :image_path, :seats, :event_date, :price, :active, :city_id, :id])
    #     |> Repo.all
    # end
    events =
    case params["city_id"] do
      nil ->
        # IO.puts("+++")
        datetime = Timex.now("America/Tijuana")
        query = from u in Event, where: u.active == 1 and u.event_date >= ^datetime, order_by: u.inserted_at
        Repo.all(query)
      value ->
        # IO.puts("+++++++++++++++++++++++++++")
        # IO.inspect(params)
        # IO.inspect(value)
        # query = from u in Event, where: u.city_id >= ^value
        # IO.inspect(query)
        # Repo.all(query)
        # Event
        #   |> QueryFilter.filter(%Event{}, params, [:city_id, :active, :id])
        #   |> Repo.all
        datetime = Timex.now("America/Tijuana")
        query = from u in Event, where: u.city_id == ^value and u.active == 1 and u.event_date >= ^datetime, order_by: u.inserted_at
        Repo.all(query)
    end


    # events =
    #   Event
    #   |> QueryFilter.filter(%Event{}, params, [:name, :description, :image_path, :seats, :event_date, :price, :active, :city_id, :id])
    #   |> Repo.all

    render(conn, "index.json", events: events)
  end

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
