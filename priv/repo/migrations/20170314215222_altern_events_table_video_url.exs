defmodule BoleteraApi.Repo.Migrations.AlternEventsTableVideoUrl do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :video_url, :string
    end
  end
end
