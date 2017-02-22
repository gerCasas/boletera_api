defmodule BoleteraApi.PageController do
  use BoleteraApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
