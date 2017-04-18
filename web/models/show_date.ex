defmodule BoleteraApi.ShowDate do
  use BoleteraApi.Web, :model

  schema "showdates" do
    field :show_date, Ecto.DateTime
    belongs_to :event, BoleteraApi.Event
    has_many :datehours, MarketApi.DateHour

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:show_date])
    |> validate_required([:show_date])
  end
end
