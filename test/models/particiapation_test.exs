defmodule Examiner.ParticiapationTest do
  use Examiner.ModelCase

  alias Examiner.Particiapation

  @valid_attrs %{mark: "some content", test_id: 42, evaluation: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Particiapation.changeset(%Particiapation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Particiapation.changeset(%Particiapation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
