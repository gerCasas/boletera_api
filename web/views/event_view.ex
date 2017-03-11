defmodule BoleteraApi.EventView do
  use BoleteraApi.Web, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, BoleteraApi.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, BoleteraApi.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      name: event.name,
      description: event.description,
      image_path: event.image_path,
      seats: event.seats,
      event_date: event.event_date,
      price: event.price,
      active: event.active,
      city_id: event.city_id,
      color_rgb: event.color_rgb,
      image_background_path: event.image_background_path,
      address: event.address}
  end
end
