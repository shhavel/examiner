defmodule Examiner.Repo.Migrations.CreateTest do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :locale, :string, default: "uk", null: false
      add :category, :string, null: false
      # add :difficulty_level, :string
      add :name, :string, null: false

      timestamps()
    end

    create index(:tests, [:locale, :category])
    create index(:tests, [:locale])
    create index(:tests, [:category])
  end
end
