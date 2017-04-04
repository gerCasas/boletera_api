defmodule BoleteraApi.Repo.Migrations.CreateCity do
  use Ecto.Migration

  def change do
    create table(:citys, primary_key: false) do
      add :code, :string, primary_key: true
      add :name, :string
      add :active, :integer
      add :state_id, references(:states, on_delete: :nothing)

      timestamps()
    end
    create index(:citys, [:state_id])

  end
end
