# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BoleteraApi.Repo.insert!(%BoleteraApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias BoleteraApi.Repo
alias BoleteraApi.State
alias BoleteraApi.City
alias BoleteraApi.Event
alias BoleteraApi.CarouselEvent
alias BoleteraApi.Category
alias BoleteraApi.Event_Photo
alias BoleteraApi.ShowDate
alias BoleteraApi.DateHour

# [
#   %State{
#     name: "Baja California Norte",
#     active: 1
#   },
#   %State{
#     name: "Baja California Sur",
#     active: 0
#   },
#   %State{
#     name: "Sonora",
#     active: 1
#   }
# ] |> Enum.each(&Repo.insert!(&1))
#
#
# #
# citys = [
#   %{
#     code: "mxl" <> Integer.to_string(Enum.random(0..1000)),
#     name: "Mexicali",
#     active: 1
#   },
#   %{
#     code: "tij" <> Integer.to_string(Enum.random(0..1000)),
#     name: "Tijuana",
#     active: 0
#   },
# ]

# [
#   %City{
#     code: "mxl",
#     name: "Mexicali",
#     active: 1
#   },
#   %City{
#     code: "tij",
#     name: "Tijuana",
#     active: 0
#   },
#   %City{
#     code: "herm",
#     name: "Hermosillo",
#     active: 1
#   }
# ] |> Enum.each(&Repo.insert!(&1))

# Repo.transaction fn ->
#   Repo.all(State) |> Enum.each(fn(state) ->
#     Enum.each(citys, fn(city) ->
#       new_city = Ecto.build_assoc(state, :citys, Map.put(city, :state_id, state.id))
#       Repo.insert!(new_city)
#     end)
#   end)
# end


# events = [
#   %{
#     name: "ATP Finals",
#     description: "Using a round-robin format, players will compete in a minimum of three matches each during the group stages as they battle for a berth in the knockout semi-finals.",
#     image_path: "http://i.imgur.com/Nx7rK4j.jpg",
#     seats: 1200,
#     event_date: %Ecto.DateTime{year: 2017, month: 11, day: 19, hour: 14, min: 30, sec: 0},
#     price: 400.00,
#     active: 1
#   },
#   %{
#     name: "Barclaycard presents British Summer Time Hyde Park featuring Phil Collins",
#     description: "Phil Collins is “Not Dead Yet” and will bring his tour of the same name to Barclaycard presents Hyde Park in June. Following a 2002 retirement, Phil Collins returned with a string of classic album reissues and the announcement he’d be playing.",
#     image_path: "http://i.imgur.com/Esf4Q91.jpg",
#     seats: 900,
#     event_date: %Ecto.DateTime{year: 2017, month: 06, day: 30, hour: 12, min: 00, sec: 0},
#     price: 800.00,
#     active: 1
#   },
#   %{
#     name: "Russell Howard: Round The World Tour",
#     description: "Coming to Bournemouth International Centre, critically acclaimed “comedy superstar” (Time Out), one of the best-selling acts in British stand-up, and host of the smash hit TV show Russell Howard’s Good News.",
#     image_path: "http://i.imgur.com/i7FBzzb.jpg",
#     seats: 400,
#     event_date: %Ecto.DateTime{year: 2017, month: 04, day: 04, hour: 19, min: 00, sec: 0},
#     price: 300.00,
#     active: 1
#   },
# ]

# [
#   %Event{
#     name: "ATP Finals",
#     description: "Using a round-robin format, players will compete in a minimum of three matches each during the group stages as they battle for a berth in the knockout semi-finals.",
#     image_path: "http://i.imgur.com/Nx7rK4j.jpg",
#     seats: 1200,
#     event_date: %Ecto.DateTime{year: 2017, month: 11, day: 19, hour: 14, min: 30, sec: 0},
#     price: 400.00,
#     active: 1
#   },
#   %Event{
#     name: "Barclaycard presents British Summer Time Hyde Park featuring Phil Collins",
#     description: "Phil Collins is “Not Dead Yet” and will bring his tour of the same name to Barclaycard presents Hyde Park in June. Following a 2002 retirement, Phil Collins returned with a string of classic album reissues and the announcement he’d be playing.",
#     image_path: "http://i.imgur.com/Esf4Q91.jpg",
#     seats: 900,
#     event_date: %Ecto.DateTime{year: 2017, month: 06, day: 30, hour: 12, min: 00, sec: 0},
#     price: 800.00,
#     active: 1
#   },
#   %Event{
#     name: "Russell Howard: Round The World Tour",
#     description: "Coming to Bournemouth International Centre, critically acclaimed “comedy superstar” (Time Out), one of the best-selling acts in British stand-up, and host of the smash hit TV show Russell Howard’s Good News.",
#     image_path: "http://i.imgur.com/i7FBzzb.jpg",
#     seats: 400,
#     event_date: %Ecto.DateTime{year: 2017, month: 04, day: 04, hour: 19, min: 00, sec: 0},
#     price: 300.00,
#     active: 1
#   }
# ] |> Enum.each(&Repo.insert!(&1))

# Repo.transaction fn ->
#   Repo.all(City) |> Enum.each(fn(city) ->
#     Enum.each(events, fn(event) ->
#       new_event = Ecto.build_assoc(city, :events, Map.put(event, :city_id, city.code))
#       Repo.insert!(new_event)
#     end)
#   end)
# end


# carousel_events = [
#   %{
#     image_path: "http://i.imgur.com/Nx7rK4j.jpg",
#     active: 1
#   },
#   %{
#     image_path: "http://i.imgur.com/Esf4Q91.jpg",
#     active: 1
#   },
#   %{
#     image_path: "http://i.imgur.com/i7FBzzb.jpg",
#     active: 1
#   },
# ]

# [
#   %CarouselEvent{
#     image_path: "http://i.imgur.com/YxuCcfU.jpg",
#     active: 1
#   },
#   %CarouselEvent{
#     image_path: "http://i.imgur.com/w0anexQ.jpg",
#     active: 1
#   },
#   %CarouselEvent{
#     image_path: "http://i.imgur.com/wZCBL13.jpg",
#     active: 1
#   }
# ] |> Enum.each(&Repo.insert!(&1))

# Repo.transaction fn ->
#   Repo.all(Event) |> Enum.each(fn(event) ->
#     Enum.each(carousel_events, fn(carousel_event) ->
#       new_carouselevent = Ecto.build_assoc(event, :carouselevents, Map.put(carousel_event, :event_id, event.id))
#       Repo.insert!(new_carouselevent)
#     end)
#   end)
# end

#
# [
#   %Category{
#     code: "Deportes",
#     name: "Deportes",
#     order_view: 1,
#     active: 1
#   },
#   %Category{
#     code: "Entretenmimiento",
#     name: "Entretenmimiento",
#     order_view: 2,
#     active: 1
#   },
#   %Category{
#     code: "Otros",
#     name: "Otros",
#     order_view: 3,
#     active: 1
#   }
# ] |> Enum.each(&Repo.insert!(&1))
#
#
# event_photos = [
#   %Event_Photo{
#     image_path: "http://i.imgur.com/ZBaFZw2.jpg",
#     active: 1
#   },
#   %Event_Photo{
#     image_path: "http://i.imgur.com/a1E2ofi.jpg",
#     active: 1
#   },
#   %Event_Photo{
#     image_path: "http://i.imgur.com/CzJYcFr.jpg",
#     active: 1
#   },
#   %Event_Photo{
#     image_path: "http://i.imgur.com/gklBx4V.jpg",
#     active: 1
#   }
# ] |> Enum.each(&Repo.insert!(&1))


# [
#   %ShowDate{
#     show_date: %Ecto.DateTime{year: 2017, month: 11, day: 19, hour: 14, min: 30, sec: 0},
#     event_id: 4
#   },
#   %ShowDate{
#     show_date: %Ecto.DateTime{year: 2017, month: 11, day: 20, hour: 14, min: 30, sec: 0},
#     event_id: 4
#   },
#   %ShowDate{
#     show_date: %Ecto.DateTime{year: 2017, month: 11, day: 20, hour: 18, min: 30, sec: 0},
#     event_id: 4
#   },
#   %ShowDate{
#     show_date: %Ecto.DateTime{year: 2017, month: 07, day: 11, hour: 12, min: 0, sec: 0},
#     event_id: 5
#   },
#   %ShowDate{
#     show_date: %Ecto.DateTime{year: 2017, month: 01, day: 11, hour: 14, min: 30, sec: 0},
#     event_id: 5
#   },
#   %ShowDate{
#     show_date: %Ecto.DateTime{year: 2017, month: 10, day: 15, hour: 11, min: 30, sec: 0},
#     event_id: 6
#   }
# ] |> Enum.each(&Repo.insert!(&1))
# 
# [
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 11, day: 19, hour: 14, min: 30, sec: 0},
#     show_date_id: 1
#   },
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 11, day: 20, hour: 14, min: 30, sec: 0},
#     show_date_id: 1
#   },
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 11, day: 20, hour: 18, min: 30, sec: 0},
#     show_date_id: 1
#   },
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 11, day: 20, hour: 14, min: 30, sec: 0},
#     show_date_id: 2
#   },
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 11, day: 20, hour: 18, min: 30, sec: 0},
#     show_date_id: 3
#   },
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 07, day: 11, hour: 12, min: 0, sec: 0},
#     show_date_id: 4
#   },
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 01, day: 11, hour: 14, min: 30, sec: 0},
#     show_date_id: 5
#   },
#   %DateHour{
#     date_hour: %Ecto.DateTime{year: 2017, month: 10, day: 15, hour: 11, min: 30, sec: 0},
#     show_date_id: 6
#   }
# ] |> Enum.each(&Repo.insert!(&1))
