defmodule BoleteraApi.Repo.Migrations.CreateCity do
  use Ecto.Migration

  def change do
    create table(:citys) do
      add :name, :string
      add :active, :integer
      add :state_id, references(:states, on_delete: :nothing)

      timestamps()
    end
    create index(:citys, [:state_id])

  end
end
