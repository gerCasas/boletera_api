defmodule BoleteraApi.Repo.Migrations.CreateCarouselEvent do
  use Ecto.Migration

  def change do
    create table(:carouselevents) do
      add :image_path, :string
      add :active, :integer
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end
    create index(:carouselevents, [:event_id])

  end
end
