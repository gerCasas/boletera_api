defmodule BoleteraApi.Repo.Migrations.AlternEventTable do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :description, :string
      add :image_path, :string
    end

  end
end
