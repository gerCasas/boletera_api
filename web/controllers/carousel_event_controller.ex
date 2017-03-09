defmodule BoleteraApi.CarouselEventController do
  use BoleteraApi.Web, :controller

  alias BoleteraApi.CarouselEvent
  alias BoleteraApi.Event

  def index(conn, params) do
    carouselevents =
    case params["city_id"] do
      nil ->
        Repo.all(CarouselEvent)
      value ->
        query = from ce in CarouselEvent,
        join: e in Event, where: ce.event_id == e.id
        and e.city_id == ^value
        and e.active == 1
        and ce.active == 1
        Repo.all(query)
    end
    render(conn, "index.json", carouselevents: carouselevents)
  end

  def create(conn, %{"carousel_event" => carousel_event_params}) do
    changeset = CarouselEvent.changeset(%CarouselEvent{}, carousel_event_params)

    case Repo.insert(changeset) do
      {:ok, carousel_event} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", carousel_event_path(conn, :show, carousel_event))
        |> render("show.json", carousel_event: carousel_event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    carousel_event = Repo.get!(CarouselEvent, id)
    render(conn, "show.json", carousel_event: carousel_event)
  end

  def update(conn, %{"id" => id, "carousel_event" => carousel_event_params}) do
    carousel_event = Repo.get!(CarouselEvent, id)
    changeset = CarouselEvent.changeset(carousel_event, carousel_event_params)

    case Repo.update(changeset) do
      {:ok, carousel_event} ->
        render(conn, "show.json", carousel_event: carousel_event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    carousel_event = Repo.get!(CarouselEvent, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(carousel_event)

    send_resp(conn, :no_content, "")
  end
end
