defmodule Examiner.Question do
  use Examiner.Web, :model

  schema "questions" do
    belongs_to :test, Examiner.Test
    has_many :answers, Examiner.Answer, on_delete: :delete_all
    field :text, :string
    field :delete, :boolean, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :delete])
    |> cast_assoc(:answers)
    |> foreign_key_constraint(:test_id)
    |> validate_required([:text])
    |> maybe_mark_for_deletion()
  end

  defp maybe_mark_for_deletion(changeset) do
    # If delete was set and it is true, let's change the action
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end
end
