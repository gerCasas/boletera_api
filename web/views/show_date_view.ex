defmodule BoleteraApi.ShowDateView do
  use BoleteraApi.Web, :view

  def render("index.json", %{showdates: showdates}) do
    %{data: render_many(showdates, BoleteraApi.ShowDateView, "show_date.json")}
  end

  def render("dates_formatted.json", %{showdates: showdates}) do
    %{data: render_many(showdates, BoleteraApi.ShowDateView, "date_formated.json")}
  end

  def render("show.json", %{show_date: show_date}) do
    %{data: render_one(show_date, BoleteraApi.ShowDateView, "show_date.json")}
  end

  def render("show_date.json", %{show_date: show_date}) do
    %{id: show_date.id,
      show_date: show_date.show_date,
      event_id: show_date.event_id}
  end

  def render("show_date_w_hours.json", %{show_date: show_date}) do
    %{id: show_date.id,
      show_date: show_date.show_date,
      event_id: show_date.event_id,
      hours: render_many(show_date.date_hours, BoleteraApi.DateHourView, "date_hour.json")}
  end

  def render("date_formated.json", %{show_date: show_date}) do
    %{id: show_date.id,
      show_date: show_date.show_date,
      event_id: show_date.event_id,
      date_hours: show_date.date_hours
      }
  end
end
