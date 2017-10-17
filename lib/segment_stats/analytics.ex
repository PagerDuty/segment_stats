defmodule SegmentStats.Analytics do
  require Logger

  def track(user_id, event, properties \\ %{}) do
    try do
      Segment.Analytics.track(user_id, event, properties)
    rescue
      e in RuntimeError -> Logger.debug("Segment call failed with error: " <> e.message)
    end
  end
end
