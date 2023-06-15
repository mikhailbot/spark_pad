defmodule SparkPad.IdeasTest do
  use SparkPad.DataCase

  import SparkPad.IdeasFixtures
  import SparkPad.AccountsFixtures

  describe "ideas" do
    alias SparkPad.Ideas
    alias SparkPad.Ideas.Spark

    @update_attrs %{name: "some updated spark"}
    @invalid_attrs %{name: nil}

    test "list_sparks/1 returns all sparks for a user" do
      user_one = user_fixture()
      user_two = user_fixture()
      spark_one = spark_fixture(%{owner_id: user_one.id})
      _spark_two = spark_fixture(%{owner_id: user_two.id})

      assert Ideas.list_sparks(user_one.id) == [spark_one]
    end

    test "create_spark/1 with valid data creates a spark" do
      user = user_fixture()

      assert {:ok, %Spark{} = _spark} =
               Ideas.create_spark(valid_spark_attributes(%{owner_id: user.id}))
    end

    test "create_spark/1 with invalid data returns error changeset" do
      user = user_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Ideas.create_spark(invalid_spark_attributes(%{owner_id: user.id}))
    end

    test "update_spark/2 with valid data updates the spark" do
      user = user_fixture()
      spark = spark_fixture(%{owner_id: user.id})

      assert {:ok, %Spark{} = _spark} = Ideas.update_spark(spark, @update_attrs)
    end

    test "update_spark/2 with invalid data returns error changeset" do
      user = user_fixture()
      spark = spark_fixture(%{owner_id: user.id})

      assert {:error, %Ecto.Changeset{}} = Ideas.update_spark(spark, @invalid_attrs)
    end

    test "get_spark/2 returns the spark with given id" do
      user = user_fixture()
      spark = spark_fixture(%{owner_id: user.id})

      assert Ideas.get_spark(spark.id) == spark
    end

    test "delete_spark/1 deletes the spark" do
      user = user_fixture()
      spark = spark_fixture(%{owner_id: user.id})

      assert {:ok, %Spark{}} = Ideas.delete_spark(spark)
    end
  end
end
