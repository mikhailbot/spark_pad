defmodule SparkPad.Repo do
  use Ecto.Repo,
    otp_app: :spark_pad,
    adapter: Ecto.Adapters.Postgres
end
