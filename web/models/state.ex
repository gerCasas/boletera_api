defmodule BoleteraApi.State do
  use BoleteraApi.Web, :model

  schema "states" do
    field :name, :string
    field :active, :integer
    has_many :citys, BoleteraApi.City
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
