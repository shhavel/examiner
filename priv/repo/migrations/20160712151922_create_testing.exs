defmodule Examiner.Repo.Migrations.CreateTesting do
  use Ecto.Migration

  def change do
    create table(:testings) do
      add :locale, :string, default: "uk", null: false
      add :category, :string, null: false
      # add :difficulty_level, :string
      add :name, :string, null: false

      timestamps()
    end

    create index(:testings, [:locale, :category])
    create index(:testings, [:locale])
    create index(:testings, [:category])
  end
end
