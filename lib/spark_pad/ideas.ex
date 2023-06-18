defmodule SparkPad.Ideas do
  @behaviour Bodyguard.Policy

  import Ecto.Query, warn: false

  alias SparkPad.Repo
  alias SparkPad.Ideas.Spark

  def authorize(:get_spark, %{id: user_id} = _user, %{owner_id: user_id} = _spark), do: :ok
  def authorize(:update_spark, %{id: user_id} = _user, %{owner_id: user_id} = _spark), do: :ok
  def authorize(:delete_spark, %{id: user_id} = _user, %{owner_id: user_id} = _spark), do: :ok
  def authorize(_, _, _), do: false

  @doc """
  Creates a Spark.

  ## Examples

      iex> create_spark(%{field: value})
      {:ok, %Spark{}}

      iex> create_spark(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spark(attrs \\ %{}) do
    %Spark{} |> Spark.create_changeset(attrs) |> Repo.insert()
  end

  def create_spark_changeset(spark, attrs \\ %{}) do
    Spark.create_changeset(spark, attrs)
  end

  @doc """
  Gets a single Spark.

  Raises `Ecto.NoResultsError` if the Spark does not exist.

  ## Examples

      iex> get_spark!(123)
      %Spark{}

      iex> get_spark!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spark!(id) do
    Spark |> where(id: ^id) |> Repo.one!()
  end

  @doc """
  Returns the list of Sparks.

  ## Examples

      iex> list_sparks(1)
      [%Spark{}, ...]

  """
  def list_sparks(user_id) do
    Spark |> where(owner_id: ^user_id) |> Repo.all()
  end

  @doc """
  Updates a Spark.

  ## Examples

      iex> update_spark(spark, %{field: new_value})
      {:ok, %Spark{}}

      iex> update_spark(spark, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spark(spark, attrs) do
    spark |> Spark.update_changeset(attrs) |> Repo.update()
  end

  @doc """
  Deletes a Spark

  ## Examples

      iex> delete_spark(spark)
      {:ok, %Spark{}}

      iex> delete_spark(spark)
      {:error, %Ecto.Changeset{}}
  """
  def delete_spark(spark) do
    spark |> Repo.delete()
  end
end
