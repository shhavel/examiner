defmodule Examiner.Tick do
  use Examiner.Web, :model

  schema "ticks" do
    belongs_to :reply, Examiner.Reply
    belongs_to :answer, Examiner.Answer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:reply_id, :answer_id])
    |> validate_required([])
    |> foreign_key_constraint(:reply_id)
    |> foreign_key_constraint(:answer_id)
  end
end
