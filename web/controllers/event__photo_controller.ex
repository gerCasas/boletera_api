defmodule BoleteraApi.Event_PhotoController do
  use BoleteraApi.Web, :controller

  alias BoleteraApi.Event_Photo

  def index(conn, params) do
    event_photos =
    case params["event_id"] do
      nil ->
        query = from event_photos in Event_Photo, where: event_photos.active == 1
        Repo.all(query)
      value ->
        query = from event_photo in Event_Photo,
        where: event_photo.event_id == ^value
        and event_photo.active == 1,
        order_by: event_photo.inserted_at
        Repo.all(query)
    end
    render(conn, "index.json", event_photos: event_photos)
  end

  def create(conn, %{"event__photo" => event__photo_params}) do
    changeset = Event_Photo.changeset(%Event_Photo{}, event__photo_params)

    case Repo.insert(changeset) do
      {:ok, event__photo} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", event__photo_path(conn, :show, event__photo))
        |> render("show.json", event__photo: event__photo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event__photo = Repo.get!(Event_Photo, id)
    render(conn, "show.json", event__photo: event__photo)
  end

  def update(conn, %{"id" => id, "event__photo" => event__photo_params}) do
    event__photo = Repo.get!(Event_Photo, id)
    changeset = Event_Photo.changeset(event__photo, event__photo_params)

    case Repo.update(changeset) do
      {:ok, event__photo} ->
        render(conn, "show.json", event__photo: event__photo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event__photo = Repo.get!(Event_Photo, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(event__photo)

    send_resp(conn, :no_content, "")
  end
end
