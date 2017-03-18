defmodule BoleteraApi.CategoryView do
  use BoleteraApi.Web, :view

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, BoleteraApi.CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, BoleteraApi.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      name: category.name,
      active: category.active}
  end
end
