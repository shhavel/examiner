defmodule Examiner.Reply do
  use Examiner.Web, :model

  schema "replies" do
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
    |> cast(params, [:question_id])
    |> cast_assoc(:opinions)
    |> validate_required([:question_id])
  end
end
