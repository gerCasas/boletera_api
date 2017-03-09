defmodule BoleteraApi.Event do
  use BoleteraApi.Web, :model

  schema "events" do
    field :name, :string
    field :description, :string
    field :image_path, :string
    field :seats, :integer
    field :event_date, Ecto.DateTime
    field :price, :decimal
    field :active, :integer
    belongs_to :city, BoleteraApi.City
    has_many :carouselevents, BoleteraApi.CarouselEvent

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :image_path, :seats, :event_date, :price, :active])
    |> validate_required([:name, :description, :image_path, :seats, :event_date, :price, :active])
  end
end
