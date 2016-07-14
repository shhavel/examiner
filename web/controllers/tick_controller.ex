defmodule Examiner.TickController do
  use Examiner.Web, :controller

  alias Examiner.Tick

  def index(conn, _params) do
    ticks = Repo.all(Tick)
    render(conn, "index.html", ticks: ticks)
  end

  def new(conn, _params) do
    changeset = Tick.changeset(%Tick{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tick" => tick_params}) do
    changeset = Tick.changeset(%Tick{}, tick_params)

    case Repo.insert(changeset) do
      {:ok, _tick} ->
        conn
        |> put_flash(:info, "Tick created successfully.")
        |> redirect(to: tick_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tick = Repo.get!(Tick, id)
    render(conn, "show.html", tick: tick)
  end

  def edit(conn, %{"id" => id}) do
    tick = Repo.get!(Tick, id)
    changeset = Tick.changeset(tick)
    render(conn, "edit.html", tick: tick, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tick" => tick_params}) do
    tick = Repo.get!(Tick, id)
    changeset = Tick.changeset(tick, tick_params)

    case Repo.update(changeset) do
      {:ok, tick} ->
        conn
        |> put_flash(:info, "Tick updated successfully.")
        |> redirect(to: tick_path(conn, :show, tick))
      {:error, changeset} ->
        render(conn, "edit.html", tick: tick, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tick = Repo.get!(Tick, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(tick)

    conn
    |> put_flash(:info, "Tick deleted successfully.")
    |> redirect(to: tick_path(conn, :index))
  end
end
