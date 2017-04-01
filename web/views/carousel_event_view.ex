defmodule BoleteraApi.CarouselEventView do
  use BoleteraApi.Web, :view

  def render("index.json", %{carouselevents: carouselevents}) do
    %{data: render_many(carouselevents, BoleteraApi.CarouselEventView, "carousel_event.json")}
  end

  def render("show.json", %{carousel_event: carousel_event}) do
    %{data: render_one(carousel_event, BoleteraApi.CarouselEventView, "carousel_event.json")}
  end

  def render("carousel_event.json", %{carousel_event: carousel_event}) do
    %{id: carousel_event.id,
      image_path: carousel_event.image_path,
      event_id: carousel_event.event_id,
      active: carousel_event.active,
      color_rgb: carousel_event.color_rgb,
      event_name: carousel_event.event_name}
  end
end
