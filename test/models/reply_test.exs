defmodule Examiner.ReplyTest do
  use Examiner.ModelCase

  alias Examiner.Reply

  @valid_attrs %{}
  # @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reply.changeset(%Reply{}, @valid_attrs)
    assert changeset.valid?
  end

  # test "changeset with invalid attributes" do
  #   changeset = Reply.changeset(%Reply{}, @invalid_attrs)
  #   refute changeset.valid?
  # end
end
