defmodule Examiner.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :testing_id, references(:testings), null: false
      add :text, :text, null: false

      timestamps()
    end

    create index(:questions, [:testing_id])
  end
end
