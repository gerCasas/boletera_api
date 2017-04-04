defmodule BoleteraApi.CityView do
  use BoleteraApi.Web, :view

  def render("index.json", %{citys: citys}) do
    %{data: render_many(citys, BoleteraApi.CityView, "city.json")}
  end

  def render("show.json", %{city: city}) do
    %{data: render_one(city, BoleteraApi.CityView, "city.json")}
  end

  def render("city.json", %{city: city}) do
    %{code: city.code,
      name: city.name,
      active: city.active,
      state_id: city.state_id}
  end
end
