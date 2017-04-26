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
    # IO.puts("+++++++++++++++++++++++++++")

    if Map.has_key?(event, :city_name) do

      event_details = %{
        event_details: [
          %{key: "Reembolso", value: event.refounds},
          %{key: "Regalos", value: event.gifting},
          %{key: "Asistencia", value: event.assistance},
          %{key: "Precios", value: event.prices},
          %{key: "Restricciones", value: event.restrictions},
          %{key: "Tickets", value: event.tickets},
          %{key: "Preguntas", value: event.questions},
          %{key: "Restricciones de edad", value: event.age_restrictions},
          %{key: "Limite de compra", value: event.purchase_limit},
          %{key: "Info adicional", value: event.additional_info}
        ]
      }

      event_details = filter_null_event_keys(event_details)

      %{id: event.id,
        name: event.name,
        description: event.description,
        image_path: event.image_path,
        seats: event.seats,
        event_date: event.event_date,
        final_event_date: event.final_event_date,
        price: event.price,
        active: event.active,
        color_rgb: event.color_rgb,
        image_background_path: event.image_background_path,
        address: event.address,
        limit_per_purchase: event.limit_per_purchase,
        video_url: event.video_url,
        city_id: event.city_id,
        city_name: event.city_name,
        category_id: event.category_id,

        details: event_details
      }

    else
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
        category_id: event.category_id
        }
    end
  end

  def filter_null_event_keys(event) do
    Enum.filter(event.event_details, &filter_nulls/1)
  end

  def filter_nulls(row) do
    if row.value != nil do
      row
    else
      false
    end
  end

end
