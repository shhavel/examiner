defmodule Examiner.Result do
  use Examiner.Web, :model

  schema "results" do
    field :testing_id, :integer
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
    |> validate_required([:testing_id, :valuation, :mark])
  end
end
