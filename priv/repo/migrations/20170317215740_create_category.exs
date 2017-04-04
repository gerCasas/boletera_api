defmodule BoleteraApi.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :code, :string, primary_key: true
      add :name, :string
      add :active, :integer

      timestamps()
    end
  end
end
