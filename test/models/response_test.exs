defmodule Examiner.ResponseTest do
  use Examiner.ModelCase

  alias Examiner.Response

  @valid_attrs %{question_text: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Response.changeset(%Response{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Response.changeset(%Response{}, @invalid_attrs)
    refute changeset.valid?
  end
end
