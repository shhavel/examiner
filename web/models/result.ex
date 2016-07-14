defmodule Examiner.Result do
  use Examiner.Web, :model

  schema "results" do
    belongs_to :test, Examiner.Test
    field :valuation, :float
    field :mark, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:test_id, :valuation, :mark])
    |> foreign_key_constraint(:test_id)
    |> validate_required([:test_id])
  end
end
