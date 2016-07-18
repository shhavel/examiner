defmodule Examiner.Opinion do
  use Examiner.Web, :model

  schema "opinions" do
    belongs_to :reply, Examiner.Reply
    belongs_to :answer, Examiner.Answer
    field :agree, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:answer_id, :agree])
    |> validate_required([:answer_id, :agree])
  end
end
