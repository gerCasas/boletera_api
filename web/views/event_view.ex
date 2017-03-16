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

      event_details = %{
        event_details: [
          %{key: "Refounds", value: event.refounds},
          %{key: "Gifting", value: event.gifting},
          %{key: "Assistance", value: event.assistance},
          %{key: "Prices", value: event.prices},
          %{key: "Restrictions", value: event.restrictions},
          %{key: "Tickets", value: event.tickets},
          %{key: "Questions", value: event.questions},
          %{key: "Age Restrictions", value: event.age_restrictions},
          %{key: "Purchase Limit", value: event.purchase_limit},
          %{key: "Additional Info", value: event.additional_info}
        ]
      }

      event_details = filter_null_event_keys(event_details)

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

        details: event_details
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

  def filter_null_event_keys(event) do
    eventfiltered = Enum.filter(event.event_details, &filter_nulls/1)
  end

  def filter_nulls(row) do
    if row.value != nil do
      row
    else
      false
    end
  end

end
