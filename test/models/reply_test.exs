defmodule Examiner.ReplyTest do
  use Examiner.ModelCase

  alias Examiner.Reply

  @valid_attrs %{question_id: 43}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reply.changeset(%Reply{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reply.changeset(%Reply{}, @invalid_attrs)
    refute changeset.valid?
  end
end
