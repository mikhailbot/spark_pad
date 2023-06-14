defmodule SparkPad.IdeasTest do
  use SparkPad.DataCase

  import SparkPad.IdeasFixtures

  describe "ideas" do
    alias SparkPad.Ideas
    alias SparkPad.Ideas.Spark

    @valid_attrs %{name: "some spark"}
    @update_attrs %{name: "some updated spark"}
    @invalid_attrs %{name: nil}

    test "list_ideas/0 returns all ideas" do
      spark = spark_fixture()

      assert Ideas.list_sparks() == [spark]
    end

    test "create_spark/1 with valid data creates a spark" do
      assert {:ok, %Spark{} = _spark} = Ideas.create_spark(@valid_attrs)
    end

    test "create_spark/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ideas.create_spark(@invalid_attrs)
    end

    test "update_spark/2 with valid data updates the spark" do
      spark = spark_fixture()
      assert {:ok, %Spark{} = _spark} = Ideas.update_spark(spark, @update_attrs)
    end

    test "update_spark/2 with invalid data returns error changeset" do
      spark = spark_fixture()

      assert {:error, %Ecto.Changeset{}} = Ideas.update_spark(spark, @invalid_attrs)
    end
  end
end
