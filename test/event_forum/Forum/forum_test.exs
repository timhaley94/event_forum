defmodule EventForum.CoreTest do
  use EventForum.DataCase
  alias EventForum.Forum

  describe "events" do
    alias EventForum.Forum.Event

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forum.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Forum.list_events() == [event]
    end

    # test "new_events/0 orders events by inserted_at then score" do
    #
    # end
    #
    # test "new_events/0 filters by whether they are happening_tonight" do
    #
    # end
    #
    # test "popular_events/0 orders events by score then inserted_at" do
    #
    # end
    #
    # test "popular_events/0 filters by whether they are happening_tonight" do
    #
    # end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Forum.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Forum.create_event(@valid_attrs)
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forum.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Forum.update_event(event, @update_attrs)
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Forum.update_event(event.id, @invalid_attrs)
      assert event == Forum.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Forum.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Forum.get_event!(event.id) end
    end
  end
end
