defmodule Examiner.Test do
  use Examiner.Web, :model

  schema "tests" do
    field :locale, :string
    field :category, :string
    field :guide, :string
    field :name, :string
    has_many :questions, Examiner.Question, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:locale, :category, :name])
    |> cast_assoc(:questions)
    |> validate_required([:locale, :category, :name])
  end
end
