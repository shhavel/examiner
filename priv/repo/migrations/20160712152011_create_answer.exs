defmodule Examiner.Repo.Migrations.CreateAnswer do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :question_id, :integer, null: false
      add :text, :text, null: false
      add :correct, :boolean, default: false, null: false

      timestamps()
    end

    create index(:answers, [:question_id])
  end
end
