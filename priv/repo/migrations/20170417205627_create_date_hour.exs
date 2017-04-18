defmodule BoleteraApi.Repo.Migrations.CreateDateHour do
  use Ecto.Migration

  def change do
    create table(:datehours) do
      add :date_hour, :datetime
      add :show_date_id, references(:showdates, on_delete: :nothing)

      timestamps()
    end
    create index(:datehours, [:show_date_id])

  end
end
