defmodule Examiner.Reply do
  use Examiner.Web, :model

  schema "replies" do
    belongs_to :participation, Examiner.Participation
    belongs_to :question, Examiner.Question
    has_many :ticks, Examiner.Tick

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:participation_id, :question_id])
    |> cast_assoc(:ticks)
    |> foreign_key_constraint(:participation_id)
    |> foreign_key_constraint(:question_id)
    |> validate_required([])
  end
end
