defmodule BoleteraApi.Repo.Migrations.AlternEventsFinalEventDate do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :final_event_date, :datetime
    end
  end
end
