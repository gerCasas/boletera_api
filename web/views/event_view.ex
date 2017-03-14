defmodule BoleteraApi.EventView do
  use BoleteraApi.Web, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, BoleteraApi.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, BoleteraApi.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    # IO.puts("+++++++++++++++++++++++++++")
    # IO.inspect(event)

    if Map.has_key?(event, :city_name) do
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
        address: event.address,
        video_url: event.video_url,
        city_id: event.city_id,
        city_name: event.city_name,

        details: %{
            refounds: event.refounds,
            gifting: event.gifting,
            assistance: event.assistance,
            prices: event.prices,
            restrictions: event.restrictions,
            tickets: event.tickets,
            questions: event.questions,
            age_restrictions: event.age_restrictions,
            purchase_limit: event.purchase_limit,
            additional_info: event.additional_info
          }
        }

    else
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
        address: event.address,
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
        video_url: event.video_url
        }
    end

  end
end
