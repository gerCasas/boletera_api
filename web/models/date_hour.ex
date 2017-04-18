defmodule BoleteraApi.DateHour do
  use BoleteraApi.Web, :model

  schema "datehours" do
    field :date_hour, Ecto.DateTime
    belongs_to :show_date, BoleteraApi.ShowDate

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date_hour])
    |> validate_required([:date_hour])
  end
end
