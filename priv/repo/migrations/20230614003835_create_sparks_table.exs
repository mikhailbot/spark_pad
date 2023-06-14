defmodule SparkPad.Repo.Migrations.CreateSparksTable do
  use Ecto.Migration

  def change do
    create table(:sparks) do
      add :name, :string

      timestamps()
    end
  end
end
