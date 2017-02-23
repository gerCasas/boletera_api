defmodule BoleteraApi.City do
  use BoleteraApi.Web, :model

  schema "citys" do
    field :name, :string
    field :active, :integer
    belongs_to :state, BoleteraApi.State
    has_many :events, BoleteraApi.Event
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :active])
    |> validate_required([:name, :active])
  end
end
