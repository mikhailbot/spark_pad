defmodule SparkPad.Repo.Migrations.CreateSparksTable do
  use Ecto.Migration

  def change do
    create table(:sparks) do
      add :name, :string
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:sparks, [:owner_id])
  end
end
