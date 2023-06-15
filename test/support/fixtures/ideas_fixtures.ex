defmodule SparkPad.IdeasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SparkPad.Ideas` context.
  """

  def valid_spark_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      name: "some spark",
      owner_id: nil
    })
  end

  def invalid_spark_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      name: nil,
      owner_id: nil
    })
  end

  @doc """
  Generate a spark
  """
  def spark_fixture(attrs \\ %{}) do
    {:ok, spark} =
      attrs
      |> valid_spark_attributes()
      |> SparkPad.Ideas.create_spark()

    spark
  end
end
