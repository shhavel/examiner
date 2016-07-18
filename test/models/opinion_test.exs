defmodule Examiner.OpinionTest do
  use Examiner.ModelCase

  alias Examiner.Opinion

  @valid_attrs %{agree: true, answer_correct: true, answer_text: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Opinion.changeset(%Opinion{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Opinion.changeset(%Opinion{}, @invalid_attrs)
    refute changeset.valid?
  end
end
