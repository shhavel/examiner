defmodule Examiner.Testing do
  use Examiner.Web, :model

  schema "testings" do
    field :locale, :string
    field :grade, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:locale, :grade, :name])
    |> validate_required([:locale, :grade, :name])
  end
end
