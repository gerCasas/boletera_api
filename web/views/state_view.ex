defmodule BoleteraApi.StateView do
  use BoleteraApi.Web, :view

  def render("index.json", %{states: states}) do
    %{data: render_many(states, BoleteraApi.StateView, "state.json")}
  end

  def render("show.json", %{state: state}) do
    %{data: render_one(state, BoleteraApi.StateView, "state.json")}
  end

  def render("state.json", %{state: state}) do
    %{id: state.id,
      name: state.name,
      active: state.active}
  end
end
