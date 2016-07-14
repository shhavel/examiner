defmodule Examiner.Repo.Migrations.CreateTick do
  use Ecto.Migration

  def change do
    create table(:ticks) do
      add :reply_id, references(:replies, on_delete: :delete_all), null: false
      add :answer_id, references(:answers, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:ticks, [:reply_id])
    create index(:ticks, [:answer_id])
    create unique_index(:ticks, [:reply_id, :answer_id])
  end
end
