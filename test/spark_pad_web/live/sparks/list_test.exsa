defmodule SparkPadWeb.Sparks.ListLiveTest do
  use SparkPadWeb.ConnCase

  import Phoenix.LiveViewTest
  import SparkPad.AccountsFixtures
  import SparkPad.IdeasFixtures

  describe "Sparks list page" do
    test "renders list page", %{conn: conn} do
      {:ok, _lv, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/sparks")

      assert html =~ "Sparks"
    end

    test "renders list of sparks", %{conn: conn} do
      user = user_fixture()
      spark = spark_fixture(%{owner_id: user.id})

      {:ok, _lv, html} =
        conn
        |> log_in_user(user)
        |> live(~p"/sparks")

      assert html =~ spark.name
    end
  end
end
