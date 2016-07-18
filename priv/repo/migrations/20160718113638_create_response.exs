defmodule Examiner.Repo.Migrations.CreateResponse do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :question_text, :string
      add :participation_id, references(:participations, on_delete: :nothing)
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps()
    end

    create index(:responses, [:participation_id])
    create index(:responses, [:question_id])
    create unique_index(:responses, [:participation_id, :question_id])
  end
end
