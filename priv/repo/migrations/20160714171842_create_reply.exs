defmodule Examiner.Repo.Migrations.CreateReply do
  use Ecto.Migration

  def change do
    create table(:replies) do
      add :participation_id, references(:participations, on_delete: :delete_all), null: false
      add :question_id, references(:questions, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:replies, [:participation_id])
    create index(:replies, [:question_id])
    create unique_index(:replies, [:participation_id, :question_id])
  end
end
