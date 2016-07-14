defmodule Examiner.ReplyController do
  use Examiner.Web, :controller

  alias Examiner.Reply

  def index(conn, _params) do
    replies = Repo.all(Reply)
    render(conn, "index.html", replies: replies)
  end

  def new(conn, _params) do
    changeset = Reply.changeset(%Reply{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reply" => reply_params}) do
    changeset = Reply.changeset(%Reply{}, reply_params)

    case Repo.insert(changeset) do
      {:ok, _reply} ->
        conn
        |> put_flash(:info, "Reply created successfully.")
        |> redirect(to: reply_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reply = Repo.get!(Reply, id)
    render(conn, "show.html", reply: reply)
  end

  def edit(conn, %{"id" => id}) do
    reply = Repo.get!(Reply, id)
    changeset = Reply.changeset(reply)
    render(conn, "edit.html", reply: reply, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reply" => reply_params}) do
    reply = Repo.get!(Reply, id)
    changeset = Reply.changeset(reply, reply_params)

    case Repo.update(changeset) do
      {:ok, reply} ->
        conn
        |> put_flash(:info, "Reply updated successfully.")
        |> redirect(to: reply_path(conn, :show, reply))
      {:error, changeset} ->
        render(conn, "edit.html", reply: reply, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reply = Repo.get!(Reply, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reply)

    conn
    |> put_flash(:info, "Reply deleted successfully.")
    |> redirect(to: reply_path(conn, :index))
  end
end
