defmodule SparkPad.Ideas do
  import Ecto.Query, warn: false

  alias SparkPad.Repo
  alias SparkPad.Ideas.Spark

  def create_spark(attrs \\ %{}) do
    %Spark{} |> Spark.create_changeset(attrs) |> Repo.insert()
  end

  def list_sparks do
    Repo.all(Spark)
  end

  def update_spark(spark, attrs) do
    spark |> Spark.update_changeset(attrs) |> Repo.update()
  end
end
