defmodule BoleteraApi.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :string
      add :image_path, :string
      add :seats, :integer
      add :event_date, :datetime
      add :price, :decimal
      add :active, :integer
      add :city_id, references(:citys, on_delete: :nothing)

      timestamps()
    end
    create index(:events, [:city_id])

  end
end
