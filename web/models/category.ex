defmodule BoleteraApi.Category do
  use BoleteraApi.Web, :model

  schema "categories" do
    field :name, :string
    field :active, :integer

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
