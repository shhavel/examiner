defmodule Examiner.Question do
  use Examiner.Web, :model

  schema "questions" do
    belongs_to :testing, Examiner.Testing
    field :text, :string
    has_many :answers, Examiner.Answer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:testing_id, :text])
    |> foreign_key_constraint(:testing_id)
    |> validate_required([:testing_id, :text])
  end
end
