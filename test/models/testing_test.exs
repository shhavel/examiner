defmodule Examiner.TestingTest do
  use Examiner.ModelCase

  alias Examiner.Testing

  @valid_attrs %{category: "some content", locale: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Testing.changeset(%Testing{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Testing.changeset(%Testing{}, @invalid_attrs)
    refute changeset.valid?
  end
end
