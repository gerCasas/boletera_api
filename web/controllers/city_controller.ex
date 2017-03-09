defmodule BoleteraApi.CityController do
  use BoleteraApi.Web, :controller

  alias BoleteraApi.City

  def index(conn, params) do
    IO.puts("++++++++")
    IO.inspect(params)
    IO.puts("++++++++")
    query = from u in City, where: u.active == 1
    citys = Repo.all(query)
    render(conn, "index.json", citys: citys)
  end

  def create(conn, %{"city" => city_params}) do
    changeset = City.changeset(%City{}, city_params)

    case Repo.insert(changeset) do
      {:ok, city} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", city_path(conn, :show, city))
        |> render("show.json", city: city)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    city = Repo.get!(City, id)
    render(conn, "show.json", city: city)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Repo.get!(City, id)
    changeset = City.changeset(city, city_params)

    case Repo.update(changeset) do
      {:ok, city} ->
        render(conn, "show.json", city: city)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BoleteraApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Repo.get!(City, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(city)

    send_resp(conn, :no_content, "")
  end
end
