defmodule Examiner.Repo.Migrations.CreateResult do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :testing_id, references(:testings), null: false
      add :valuation, :float
      add :mark, :string

      timestamps()
    end
  end
end
