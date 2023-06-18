defmodule SparkPadWeb.Sparks.New do
  use SparkPadWeb, :live_view

  alias SparkPad.Ideas
  alias SparkPad.Ideas.Spark

  on_mount {SparkPadWeb.UserAuth, :ensure_authenticated}

  def mount(_params, _session, socket) do
    spark_create_changeset = Ideas.create_spark_changeset(%Spark{})

    socket = socket |> assign(:new_spark_form, to_form(spark_create_changeset))

    {:ok, socket}
  end

  def handle_event("create_spark", params, socket) do
    user = socket.assigns.current_user
    %{"spark" => spark} = params

    spark = spark |> Map.put("owner_id", user.id) |> IO.inspect()

    case Ideas.create_spark(spark) do
      {:ok, spark} ->
        {:noreply, socket |> redirect(to: ~p"/sparks/#{spark.id}")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply,
         socket
         |> assign(new_spark_form: to_form(changeset))
         |> put_flash(:error, "Spark was invalid, please try again")}

      {:error, _} ->
        IO.puts("error")
        {:noreply, socket |> put_flash(:error, "Spark was invalid, please try again")}

      _ ->
        IO.puts("unknown")
        {:noreply, socket |> put_flash(:error, "Spark was invalid, please try again")}
    end
  end
end
