defmodule BoleteraApi.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :active, :integer

      timestamps()
    end
  end
end
