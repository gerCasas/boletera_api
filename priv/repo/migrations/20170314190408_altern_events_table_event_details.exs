defmodule BoleteraApi.Repo.Migrations.AlternEventsTableEventDetails do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :refounds, :string
      add :gifting, :string
      add :assistance, :string
      add :prices, :string
      add :restrictions, :string
      add :tickets, :string
      add :questions, :string
      add :age_restrictions, :string
      add :purchase_limit, :string
      add :additional_info, :string
    end
  end
end
