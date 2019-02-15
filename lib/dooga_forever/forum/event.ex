defmodule Dooga.Forum.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias Dooga.Accounts.User
  alias Dooga.Forum.Reaction

  @required_fields ~w(name start_datetime location)a
  @optional_fields ~w(description end_datetime cost_dollars)a
  @fields Enum.concat(@required_fields, @optional_fields)

  @required_assoc_fields ~w(creator)a
  @optional_assoc_fields ~w(likes)a

  @max_duration 2880 # 2 days in minutes
  @max_cost 10000

  schema "events" do
    field :name, :string
    field :description, :string
    field :start_datetime, :utc_datetime
    field :end_datetime, :utc_datetime
    field :location, :string
    field :cost_dollars, :decimal

    belongs_to :creator, User
    many_to_many :reactors, User, join_through: Reaction
    timestamps()
  end

  defp cast(event, attrs) do
    event
    |> cast(attrs, @fields)
  end

  defp put_assoc_fields(event, fields, attrs, required?) do
    fields
    |> Enum.reduce(event, fn field, e ->
      put_assoc(e, field, Map.fetch!(attrs, field), required: required?)
    end)
  end

  defp put_assocs(event, attrs) do
    event
    |> put_assoc_fields(@required_assoc_fields, attrs, true)
    |> put_assoc_fields(@optional_assoc_fields, attrs, false)
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
    |> put_assocs(attrs)
    |> validate()
  end
end
