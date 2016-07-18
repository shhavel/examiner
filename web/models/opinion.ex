defmodule Examiner.Opinion do
  use Examiner.Web, :model

  schema "opinions" do
    field :answer_text, :string
    field :answer_correct, :boolean, default: false
    field :agree, :boolean, default: false
    belongs_to :response, Examiner.Response
    belongs_to :answer, Examiner.Answer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:answer_text, :answer_correct, :agree])
    |> validate_required([:answer_text, :answer_correct, :agree])
  end
end
