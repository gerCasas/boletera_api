defmodule BoleteraApi.Event do
  use BoleteraApi.Web, :model

  schema "events" do
    field :name, :string
    field :description, :string
    field :image_path, :string
    field :seats, :integer
    field :event_date, Ecto.DateTime
    field :final_event_date, Ecto.DateTime
    field :price, :decimal
    field :active, :integer
    field :color_rgb, :string
    field :image_background_path, :string
    field :address, :string
    field :limit_per_purchase, :integer
    field :refounds, :string
    field :gifting, :string
    field :assistance, :string
    field :prices, :string
    field :restrictions, :string
    field :tickets, :string
    field :questions, :string
    field :age_restrictions, :string
    field :purchase_limit, :string
    field :additional_info, :string
    field :video_url, :string
    belongs_to :city, BoleteraApi.City, foreign_key: :city_id, references: :code, type: :string
    belongs_to :category, BoleteraApi.Category, foreign_key: :category_id, references: :code, type: :string
    has_many :carouselevents, BoleteraApi.CarouselEvent
    has_many :event_photos, BoleteraApi.Event_Photo
    has_many :showdates, BoleteraApi.ShowDate

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :image_path, :seats, :event_date, :price, :active, :color_rgb, :image_background_path, :address, :refounds, :gifting, :assistance, :prices, :restrictions, :tickets, :questions, :age_restrictions, :purchase_limit, :additional_info, :video_url])
    |> validate_required([:name, :description, :image_path, :seats, :event_date, :final_event_date, :price, :active, :color_rgb, :address])
  end
end
