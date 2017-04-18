defmodule BoleteraApi.DateHourView do
  use BoleteraApi.Web, :view

  def render("index.json", %{datehours: datehours}) do
    %{data: render_many(datehours, BoleteraApi.DateHourView, "date_hour.json")}
  end

  def render("show.json", %{date_hour: date_hour}) do
    %{data: render_one(date_hour, BoleteraApi.DateHourView, "date_hour.json")}
  end

  def render("date_hour.json", %{date_hour: date_hour}) do
    %{id: date_hour.id,
      date_hour: date_hour.date_hour,
      show_date_id: date_hour.show_date_id}
  end
end
