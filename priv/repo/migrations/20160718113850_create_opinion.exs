defmodule Examiner.Repo.Migrations.CreateOpinion do
  use Ecto.Migration

  def change do
    create table(:opinions) do
      add :answer_text, :string
      add :answer_correct, :boolean, default: false, null: false
      add :agree, :boolean, default: false, null: false
      add :response_id, references(:responses, on_delete: :nothing)
      add :answer_id, references(:answers, on_delete: :nothing)

      timestamps()
    end

    create index(:opinions, [:response_id])
    create index(:opinions, [:answer_id])
    create unique_index(:opinions, [:response_id, :answer_id])
  end
end
