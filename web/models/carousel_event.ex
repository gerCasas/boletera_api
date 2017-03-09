defmodule BoleteraApi.CarouselEvent do
  use BoleteraApi.Web, :model

  schema "carouselevents" do
    field :image_path, :string
    field :active, :integer
    belongs_to :event, BoleteraApi.Event

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:image_path, :active])
    |> validate_required([:image_path, :active])
  end
end
