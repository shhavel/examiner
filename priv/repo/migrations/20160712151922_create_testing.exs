defmodule Examiner.Repo.Migrations.CreateTesting do
  use Ecto.Migration

  def change do
    create table(:testings) do
      add :locale, :string, default: "uk", null: false
      add :grade, :string, null: false
      add :name, :string, null: false

      timestamps()
    end

    create index(:testings, [:locale, :grade])
    create index(:testings, [:locale])
    create index(:testings, [:grade])
  end
end
