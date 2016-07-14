defmodule Examiner.Question do
  use Examiner.Web, :model

  schema "questions" do
    belongs_to :test, Examiner.Test
    field :text, :string
    has_many :answers, Examiner.Answer, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:test_id, :text])
    |> foreign_key_constraint(:test_id)
    |> validate_required([:test_id, :text])
  end
end
