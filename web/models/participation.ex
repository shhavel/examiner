defmodule Examiner.Participation do
  use Examiner.Web, :model

  schema "participations" do
    belongs_to :test, Examiner.Test
    field :evaluation, :float
    field :mark, :string
    has_many :replies, Examiner.Reply, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:test_id, :evaluation, :mark])
    |> foreign_key_constraint(:test_id)
    |> validate_required([:test_id])
  end
end
