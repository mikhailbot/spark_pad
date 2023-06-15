defmodule SparkPad.Ideas do
  @behaviour Bodyguard.Policy

  import Ecto.Query, warn: false

  alias SparkPad.Repo
  alias SparkPad.Ideas.Spark

  def authorize(:get_spark, %{id: user_id} = _user, %{owner_id: user_id} = _spark), do: :ok
  def authorize(:update_spark, %{id: user_id} = _user, %{owner_id: user_id} = _spark), do: :ok
  def authorize(:delete_spark, %{id: user_id} = _user, %{owner_id: user_id} = _spark), do: :ok
  def authorize(_, _, _), do: false

  def create_spark(attrs \\ %{}) do
    %Spark{} |> Spark.create_changeset(attrs) |> Repo.insert()
  end

  def get_spark(id) do
    Spark |> where(id: ^id) |> Repo.one()
  end

  def list_sparks(user_id) do
    Spark |> where(owner_id: ^user_id) |> Repo.all()
  end

  def update_spark(spark, attrs) do
    spark |> Spark.update_changeset(attrs) |> Repo.update()
  end

  def delete_spark(spark) do
    spark |> Repo.delete()
  end
end
