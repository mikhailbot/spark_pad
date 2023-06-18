defmodule SparkPadWeb.Sparks.Show do
  use SparkPadWeb, :live_view

  alias SparkPad.Ideas

  on_mount {SparkPadWeb.UserAuth, :ensure_authenticated}

  def mount(params, _session, socket) do
    spark_id = Map.get(params, "spark_id")
    spark = Ideas.get_spark!(spark_id)

    socket = socket |> assign(spark: spark)

    {:ok, socket}
  end
end
