defmodule BoleteraApi.Repo.Migrations.AlternEventsTableCategoryId do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :category_id, references(:categories, on_delete: :nothing, column: :code, type: :string)
    end
    create index(:events, [:category_id])
  end
end
