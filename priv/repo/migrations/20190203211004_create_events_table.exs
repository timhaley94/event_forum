defmodule Dooga.Repo.Migrations.CreateEventsTable do
  use Ecto.Migration
  alias Dooga.Forum.ReactionType

  def change do
    create table(:events) do
      add :name, :string, null: false
      add :start_datetime, :utc_datetime, null: false
      add :location, :string, null: false
      add :creator_id, references(:users), null: false

      add :description, :string
      add :end_datetime, :utc_datetime
      add :cost_dollars, :decimal

      timestamps()
    end

    ReactionType.create_type

    create table(:reactions) do
      add :type, ReactionType.type()
      add :event_id, references(:events)
      add :user_id, references(:users)

      timestamps()
    end
  end
end
