defmodule SparkPad.Ideas.Spark do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sparks" do
    field :name, :string

    belongs_to :owner, SparkPad.Accounts.User

    timestamps()
  end

  @doc false
  def create_changeset(spark, attrs) do
    spark
    |> cast(attrs, [:name, :owner_id])
    |> validate_required([:name, :owner_id])
  end

  @doc false
  def update_changeset(spark, attrs) do
    spark
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
