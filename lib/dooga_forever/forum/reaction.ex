import EctoEnum
defenum Dooga.Forum.ReactionType, :reaction_type, [:like, :dislike]

defmodule Dooga.Forum.Reaction do
  use Ecto.Schema
  alias Dooga.Accounts.User
  alias Dooga.Forum.Event
  alias Dooga.Forum.ReactionType

  schema "events" do
    field :type, ReactionType
    belongs_to :user, User
    belongs_to :event, Event

    timestamps()
  end
end
