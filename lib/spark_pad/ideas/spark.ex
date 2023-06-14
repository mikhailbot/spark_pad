defmodule SparkPad.Ideas.Spark do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sparks" do
    field :name, :string

    timestamps()
  end

  def create_changeset(spark, attrs) do
    spark
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def update_changeset(spark, attrs) do
    spark
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
