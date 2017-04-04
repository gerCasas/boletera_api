defmodule BoleteraApi.CategoryView do
  use BoleteraApi.Web, :view

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, BoleteraApi.CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, BoleteraApi.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{code: category.code,
      name: category.name,
      active: category.active,
      order_view: category.order_view}
  end
end
