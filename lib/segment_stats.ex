defmodule SegmentStats do
  @moduledoc """
  Documentation for SegmentStats.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Segment, [Application.get_env(:segment_stats, :write_key)])
    ]

    opts = [strategy: :one_for_one, name: SegmentStats.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
