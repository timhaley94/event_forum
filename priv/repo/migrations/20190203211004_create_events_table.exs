defmodule Dooga.Repo.Migrations.CreateEventsTable do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string, null: false
      add :start_datetime, :utc_datetime, null: false
      add :location, :string, null: false
      add :creator_id, references(:users), null: false

      add :description, :string
      add :duration_minutes, :integer
      add :cost_dollars, :decimal

      timestamps()
    end
  end
end
