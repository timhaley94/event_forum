import EctoEnum
defenum EventForum.Forum.ReactionType, :reaction_type, [:like, :dislike]

defmodule EventForum.Forum.Reaction do
  use Ecto.Schema
  alias EventForum.Accounts.User
  alias EventForum.Forum.Event
  alias EventForum.Forum.ReactionType

  schema "events" do
    field :type, ReactionType
    belongs_to :user, User
    belongs_to :event, Event

    timestamps()
  end
end
