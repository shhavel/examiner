defmodule Examiner.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :test_id, references(:tests), null: false
      add :text, :text, null: false

      timestamps()
    end

    create index(:questions, [:test_id])
  end
end
