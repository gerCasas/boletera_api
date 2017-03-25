defmodule BoleteraApi.Repo.Migrations.CreateEvent_Photo do
  use Ecto.Migration

  def change do
    create table(:event_photos) do
      add :image_path, :string
      add :active, :integer
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end
    create index(:event_photos, [:event_id])

  end
end
