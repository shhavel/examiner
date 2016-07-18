defmodule Examiner.Participation do
  use Examiner.Web, :model

  schema "participations" do
    belongs_to :test, Examiner.Test
    has_many :responses, Examiner.Response, on_delete: :delete_all
    field :evaluation, :float
    field :mark, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:test_id, :evaluation, :mark])
    |> cast_assoc(:responses)
    |> foreign_key_constraint(:test_id)
    |> validate_required([:test_id])
  end
end
