defmodule Examiner.Testing do
  use Examiner.Web, :model

  schema "testings" do
    field :locale, :string
    field :category, :string
    field :name, :string
    has_many :questions, Examiner.Question

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:locale, :category, :name])
    |> validate_required([:locale, :category, :name])
  end
end
