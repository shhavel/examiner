defmodule Examiner.TestingControllerTest do
  use Examiner.ConnCase

  alias Examiner.Testing
  @valid_attrs %{category: "g8", locale: "uk", name: "ПРИРОДНІ УМОВИ ТА ПРИРОДНІ РЕСУРСИ"}
  @invalid_attrs %{category: "", locale: "", name: ""}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, testing_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing testings"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, testing_path(conn, :new)
    assert html_response(conn, 200) =~ "New testing"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, testing_path(conn, :create), testing: @valid_attrs
    assert redirected_to(conn) == testing_path(conn, :index)
    assert Repo.get_by(Testing, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, testing_path(conn, :create), testing: @invalid_attrs
    assert html_response(conn, 200) =~ "New testing"
  end

  test "shows chosen resource", %{conn: conn} do
    testing = Repo.insert! %Testing{category: "some content", locale: "some content", name: "some content"}
    conn = get conn, testing_path(conn, :show, testing)
    assert html_response(conn, 200) =~ "Show testing"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, testing_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    testing = Repo.insert! %Testing{category: "some content", locale: "some content", name: "some content"}
    conn = get conn, testing_path(conn, :edit, testing)
    assert html_response(conn, 200) =~ "Edit testing"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    testing = Repo.insert! %Testing{category: "some content", locale: "some content", name: "some content"}
    conn = put conn, testing_path(conn, :update, testing), testing: @valid_attrs
    assert redirected_to(conn) == testing_path(conn, :show, testing)
    assert Repo.get_by(Testing, @valid_attrs)
    assert html_response(conn, 302)
    assert get_flash(conn, :info) == "Testing updated successfully."
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    testing = Repo.insert! %Testing{category: "some content", locale: "some content", name: "some content"}
    conn = put conn, testing_path(conn, :update, testing), testing: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit testing"
  end

  test "deletes chosen resource", %{conn: conn} do
    testing = Repo.insert! %Testing{category: "some content", locale: "some content", name: "some content"}
    conn = delete conn, testing_path(conn, :delete, testing)
    assert redirected_to(conn) == testing_path(conn, :index)
    refute Repo.get(Testing, testing.id)
  end
end
