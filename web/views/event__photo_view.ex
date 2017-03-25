defmodule BoleteraApi.Event_PhotoView do
  use BoleteraApi.Web, :view

  def render("index.json", %{event_photos: event_photos}) do
    %{data: render_many(event_photos, BoleteraApi.Event_PhotoView, "event__photo.json")}
  end

  def render("show.json", %{event__photo: event__photo}) do
    %{data: render_one(event__photo, BoleteraApi.Event_PhotoView, "event__photo.json")}
  end

  def render("event__photo.json", %{event__photo: event__photo}) do
    %{id: event__photo.id,
      image_path: event__photo.image_path,
      active: event__photo.active,
      event_id: event__photo.event_id}
  end
end
