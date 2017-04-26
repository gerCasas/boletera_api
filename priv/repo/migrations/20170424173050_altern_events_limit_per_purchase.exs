defmodule BoleteraApi.Repo.Migrations.AlternEventsLimitPerPurchase do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :limit_per_purchase, :integer
    end
  end
end
