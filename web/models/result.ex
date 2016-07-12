defmodule Examiner.Result do
  use Examiner.Web, :model

  schema "results" do
    belongs_to :testing, Examiner.Testing
    field :valuation, :float
    field :mark, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:testing_id, :valuation, :mark])
    |> foreign_key_constraint(:testing_id)
    |> validate_required([:testing_id])
  end
end
