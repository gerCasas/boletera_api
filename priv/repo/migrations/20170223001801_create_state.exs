defmodule BoleteraApi.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string
      add :active, :integer

      timestamps()
    end

  end
end
