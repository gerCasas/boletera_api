defmodule BoleteraApi.Repo.Migrations.CreateShowDate do
  use Ecto.Migration

  def change do
    create table(:showdates) do
      add :show_date, :datetime
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end
    create index(:showdates, [:event_id])

  end
end
