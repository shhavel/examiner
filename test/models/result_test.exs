defmodule Examiner.ResultTest do
  use Examiner.ModelCase

  alias Examiner.Result

  @valid_attrs %{mark: "some content", testing_id: 42, valuation: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Result.changeset(%Result{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Result.changeset(%Result{}, @invalid_attrs)
    refute changeset.valid?
  end
end
