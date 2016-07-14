defmodule Examiner.ParticiapationControllerTest do
  use Examiner.ConnCase
  import Examiner.Fixtures

  alias Examiner.Particiapation
  @invalid_attrs %{test_id: nil}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, particiapation_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing particiapations"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, particiapation_path(conn, :new), test_id: fixture(:test).id
    assert html_response(conn, 200) =~ "New particiapation"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, particiapation_path(conn, :create), particiapation: valid_attrs(:particiapation)
    assert redirected_to(conn) == particiapation_path(conn, :index)
    assert Repo.get_by(Particiapation, valid_attrs(:particiapation))
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, particiapation_path(conn, :create), particiapation: @invalid_attrs
    assert html_response(conn, 200) =~ "New particiapation"
  end

  test "shows chosen resource", %{conn: conn} do
    particiapation = fixture(:particiapation)
    conn = get conn, particiapation_path(conn, :show, particiapation)
    assert html_response(conn, 200) =~ "Show particiapation"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, particiapation_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    particiapation = fixture(:particiapation)
    conn = get conn, particiapation_path(conn, :edit, particiapation)
    assert html_response(conn, 200) =~ "Edit particiapation"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    particiapation = fixture(:particiapation)
    conn = put conn, particiapation_path(conn, :update, particiapation), particiapation: valid_attrs(:particiapation)
    assert redirected_to(conn) == particiapation_path(conn, :show, particiapation)
    assert Repo.get_by(Particiapation, valid_attrs(:particiapation))
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    particiapation = fixture(:particiapation)
    conn = put conn, particiapation_path(conn, :update, particiapation), particiapation: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit particiapation"
  end

  test "deletes chosen resource", %{conn: conn} do
    particiapation = fixture(:particiapation)
    conn = delete conn, particiapation_path(conn, :delete, particiapation)
    assert redirected_to(conn) == particiapation_path(conn, :index)
    refute Repo.get(Particiapation, particiapation.id)
  end
end
