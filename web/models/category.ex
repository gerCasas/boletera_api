defmodule BoleteraApi.Category do
  use BoleteraApi.Web, :model

  schema "categories" do
    field :name, :string
    field :active, :integer
    field :order_view, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :active, :order_view])
    |> validate_required([:name, :active, :order_view])
  end
end
