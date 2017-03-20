defmodule BoleteraApi.Repo.Migrations.AlterCategoryOrderView do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      add :order_view, :integer
    end
  end
end
