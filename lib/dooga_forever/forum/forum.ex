defmodule Dooga.Forum do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  import ShorterMaps
  alias Dooga.Repo
  alias Dooga.Forum.Event

  # defp now(~M{timezone}) do
  #   # Make timezone aware now
  #   DateTime.now("Etc/UTC")
  # end
  #
  # defp three_am_tonight(~M{timezone}), do
  #
  # end
  #
  # defp event_end_datetime(event) do
  #
  # end
  #
  # defp event_score(event), do: 3
  #
  # defp happening_tonight(query, ~M{timezone}) do
  #   # We need to determine what is "tonight" by comparing timezone
  #   from event in query
  #   where: event_end_datetime(event) >= now(),
  #   where: event.start_datetime < three_am_tonight()
  # end
  #
  # defp by_popularity(query) do
  #   from event in query
  #   order_by [desc: event_score(event), asc: event.inserted_at]
  # end
  #
  # defp by_newness(query) do
  #   from event in query
  #   order_by [asc: event.inserted_at, desc: event_score(event)]
  # end

  @doc """
  Returns the list of filtered by whether they are happening tonight
  and ordered by their newness.

  ## Examples

      iex> new_events()
      [%Event{}, ...]

  """
  # def new_events do
  #   Event
  #   |> happening_tonight()
  #   |> by_newness()
  #   |> Repo.all()
  # end

  @doc """
  Returns the list of filtered by whether they are happening tonight
  and ordered by their popularity.

  ## Examples

      iex> popular_events()
      [%Event{}, ...]

  """
  # def popular_events(~M{timezone} = %{timezone: "Eastern/New_York"}) do
  #   Event
  #   |> happening_tonight()
  #   |> by_popularity()
  #   |> Repo.all()
  # end

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(123, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(id, attrs) do
    id
    |> get_event!()
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(123)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(id) do
    id
    |> get_event!()
    |> Repo.delete()
  end
end
