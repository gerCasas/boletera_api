defmodule BoleteraApi.EventController do
  use BoleteraApi.Web, :controller
  use Timex

  alias BoleteraApi.Event
  alias BoleteraApi.City

  def index(conn, params) do

    events =
    case params["city_id"] do
      nil ->
        datetime = Timex.now("America/Tijuana")
        query = from u in Event, where: u.active == 1
        and u.event_date >= ^datetime,
        order_by: u.event_date
        Repo.all(query)

      value ->
        datetime = Timex.now("America/Tijuana")

        # /api/citys/:city_id/events
        case params["category_id"] do
          nil ->
            query = from event in Event, join: city in City,  where: event.city_id == city.code
            and event.city_id == ^value
            and event.active == 1
            and event.event_date >= ^datetime,
            select:
            %{id: event.id,
            name: event.name,
            description: event.description,
            image_path: event.image_path,
            seats: event.seats,
            event_date: event.event_date,
            final_event_date: event.final_event_date,
            price: event.price,
            active: event.active,
            city_id: event.city_id,
            color_rgb: event.color_rgb,
            image_background_path: event.image_background_path,
            address: event.address,
            limit_per_purchase: event.limit_per_purchase,
            refounds: event.refounds,
            gifting: event.gifting,
            assistance: event.assistance,
            prices: event.prices,
            restrictions: event.restrictions,
            tickets: event.tickets,
            questions: event.questions,
            age_restrictions: event.age_restrictions,
            purchase_limit: event.purchase_limit,
            additional_info: event.additional_info,
            video_url: event.video_url,
            city_id: city.code,
            city_name: city.name,
            category_id: event.category_id
            }, order_by: event.event_date
          Repo.all(query)
          value ->
              query = from event in Event, join: city in City,  where: event.city_id == city.code
              and event.city_id == ^params["city_id"]
              and event.category_id == ^value
              and event.active == 1
              and event.event_date >= ^datetime,
              select:
              %{id: event.id,
              name: event.name,
              description: event.description,
              image_path: event.image_path,
              seats: event.seats,
              event_date: event.event_date,
              final_event_date: event.final_event_date,
              price: event.price,
              active: event.active,
              city_id: event.city_id,
              color_rgb: event.color_rgb,
              image_background_path: event.image_background_path,
              address: event.address,
              limit_per_purchase: event.limit_per_purchase,
              refounds: event.refounds,
              gifting: event.gifting,
              assistance: event.assistance,
              prices: event.prices,
              restrictions: event.restrictions,
              tickets: event.tickets,
              questions: event.questions,
              age_restrictions: event.age_restrictions,
              purchase_limit: event.purchase_limit,
              additional_info: event.additional_info,
              video_url: event.video_url,
              city_id: city.code,
              city_name: city.name,
              category_id: event.category_id
              }, order_by: event.event_date
            Repo.all(query)
        end
    end

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
    # para agregar al map el nombre de la ciudad
    city = Repo.get!(City, event.city_id)
    event = Map.put(event, :city_name, city.name)
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
