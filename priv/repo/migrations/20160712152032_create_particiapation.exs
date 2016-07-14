defmodule Examiner.Repo.Migrations.CreateParticiapation do
  use Ecto.Migration

  def change do
    create table(:particiapations) do
      add :test_id, references(:tests), null: false
      add :evaluation, :float
      add :mark, :string

      timestamps()
    end

    create index(:particiapations, [:test_id])
  end
end
