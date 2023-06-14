defmodule SparkPad.IdeasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SparkPad.Ideas` context.
  """

  @doc """
  Generate a spark
  """
  def spark_fixture(attrs \\ %{}) do
    {:ok, spark} =
      attrs
      |> Enum.into(%{
        name: "some idea"
      })
      |> SparkPad.Ideas.create_spark()

    spark
  end
end
