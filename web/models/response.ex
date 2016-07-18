defmodule Examiner.Response do
  use Examiner.Web, :model

  schema "responses" do
    field :question_text, :string
    belongs_to :participation, Examiner.Participation
    belongs_to :question, Examiner.Question
    has_many :opinions, Examiner.Opinion, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question_text])
    |> validate_required([:question_text])
  end
end
