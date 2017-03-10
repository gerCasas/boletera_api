defmodule BoleteraApi.Repo.Migrations.AlterCarouselEventsTable do
  use Ecto.Migration

  def change do
    alter table(:carouselevents) do
      add :color_rgb, :string
    end
  end
end
