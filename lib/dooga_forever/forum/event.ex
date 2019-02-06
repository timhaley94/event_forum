defmodule Dooga.Forum.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias Dooga.Accounts.User

  @required_fields ~w(name start_datetime location)a
  @optional_fields ~w(description duration_minutes cost_dollars)a
  @fields Enum.concat(@required_fields, @optional_fields)

  @required_assoc_fields ~w(creator)a
  @optional_assoc_fields ~w()a

  @max_duration 2880 # 2 days in minutes
  @max_cost 10000

  schema "events" do
    field :name, :string
    field :description, :string
    field :start_datetime, :utc_datetime
    field :duration_minutes, :integer
    field :location, :string
    field :cost_dollars, :decimal

    belongs_to :creator, User
    timestamps()
  end

  defp cast(event, attrs) do
    event
    |> cast(attrs, @fields)
  end

  defp put_assoc_fields(event) do
    @required_assoc_fields
    |> Enum.reduce(event, fn field, e ->
      put_assoc(e, field, required: true)
    end)
  end

  defp validate(event) do
    event
    |> validate_required(@required_fields)
    |> validate_inclusion(:duration_minutes, 1..@max_duration)
    |> validate_inclusion(:cost_dollars, 0..@max_cost)
  end

  def changeset(event, attrs) do
    event
    |> cast(attrs)
    |> put_assoc_fields()
    |> validate()
  end
end
