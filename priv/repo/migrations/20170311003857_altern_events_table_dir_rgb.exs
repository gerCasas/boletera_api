defmodule BoleteraApi.Repo.Migrations.AlternEventsTableDirRGB do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :color_rgb, :string
      add :image_background_path, :string
      add :address, :string
    end
  end
end
