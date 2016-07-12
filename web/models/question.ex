defmodule Examiner.Question do
  use Examiner.Web, :model

  schema "questions" do
    field :testing_id, :integer
    field :text, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:testing_id, :text])
    |> validate_required([:testing_id, :text])
  end
end
