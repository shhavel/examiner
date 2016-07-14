defmodule Examiner.TickControllerTest do
  use Examiner.ConnCase
  import Examiner.Fixtures

  alias Examiner.Tick
  @invalid_attrs %{answer_id: ""}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tick_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing ticks"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, tick_path(conn, :new)
    assert html_response(conn, 200) =~ "New tick"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, tick_path(conn, :create), tick: valid_attrs(:tick)
    assert redirected_to(conn) == tick_path(conn, :index)
    assert Repo.get_by(Tick, valid_attrs(:tick))
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tick_path(conn, :create), tick: @invalid_attrs
    assert html_response(conn, 200) =~ "New tick"
  end

  test "shows chosen resource", %{conn: conn} do
    tick = fixture(:tick)
    conn = get conn, tick_path(conn, :show, tick)
    assert html_response(conn, 200) =~ "Show tick"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, tick_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    tick = fixture(:tick)
    conn = get conn, tick_path(conn, :edit, tick)
    assert html_response(conn, 200) =~ "Edit tick"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    tick = fixture(:tick)
    conn = put conn, tick_path(conn, :update, tick), tick: valid_attrs(:tick)
    assert redirected_to(conn) == tick_path(conn, :show, tick)
    assert Repo.get_by(Tick, valid_attrs(:tick))
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tick = fixture(:tick)
    conn = put conn, tick_path(conn, :update, tick), tick: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit tick"
  end

  test "deletes chosen resource", %{conn: conn} do
    tick = fixture(:tick)
    conn = delete conn, tick_path(conn, :delete, tick)
    assert redirected_to(conn) == tick_path(conn, :index)
    refute Repo.get(Tick, tick.id)
  end
end
