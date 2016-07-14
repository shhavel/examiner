defmodule Examiner.Repo.Migrations.CreateResult do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :test_id, references(:tests), null: false
      add :valuation, :float
      add :mark, :string

      timestamps()
    end

    create index(:results, [:test_id])
  end
end
