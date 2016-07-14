defmodule Examiner.ReplyControllerTest do
  use Examiner.ConnCase
  import Examiner.Fixtures

  alias Examiner.Reply
  @invalid_attrs %{participation_id: "ss"}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, reply_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing replies"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, reply_path(conn, :new)
    assert html_response(conn, 200) =~ "New reply"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, reply_path(conn, :create), reply: valid_attrs(:reply)
    assert redirected_to(conn) == reply_path(conn, :index)
    assert Repo.get_by(Reply, valid_attrs(:reply))
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, reply_path(conn, :create), reply: @invalid_attrs
    assert html_response(conn, 200) =~ "New reply"
  end

  test "shows chosen resource", %{conn: conn} do
    reply = fixture(:reply)
    conn = get conn, reply_path(conn, :show, reply)
    assert html_response(conn, 200) =~ "Show reply"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, reply_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    reply = fixture(:reply)
    conn = get conn, reply_path(conn, :edit, reply)
    assert html_response(conn, 200) =~ "Edit reply"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    reply = fixture(:reply)
    conn = put conn, reply_path(conn, :update, reply), reply: valid_attrs(:reply)
    assert redirected_to(conn) == reply_path(conn, :show, reply)
    assert Repo.get_by(Reply, valid_attrs(:reply))
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    reply = fixture(:reply)
    conn = put conn, reply_path(conn, :update, reply), reply: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit reply"
  end

  test "deletes chosen resource", %{conn: conn} do
    reply = fixture(:reply)
    conn = delete conn, reply_path(conn, :delete, reply)
    assert redirected_to(conn) == reply_path(conn, :index)
    refute Repo.get(Reply, reply.id)
  end
end
