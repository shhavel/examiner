defmodule Examiner.Answer do
  use Examiner.Web, :model

  schema "answers" do
    field :question_id, :integer
    field :text, :string
    field :correct, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question_id, :text, :correct])
    |> validate_required([:question_id, :text, :correct])
  end
end
