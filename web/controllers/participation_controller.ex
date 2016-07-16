defmodule Examiner.ParticipationController do
  use Examiner.Web, :controller

  alias Examiner.Test
  alias Examiner.Participation

  def index(conn, _params) do
    participations = Repo.all(Participation)
    render(conn, "index.html", participations: participations)
  end

  def new(conn, %{"test_id" => test_id}) do
    test = Repo.get!(Test, test_id) |> Repo.preload([questions: :answers])
    changeset = Participation.changeset(%Participation{}, %{test_id: test_id})
    render(conn, "new.html", changeset: changeset, test: test)
  end

  def create(conn, %{"participation" => participation_params}) do
    changeset = Participation.changeset(%Participation{}, participation_params)

    case Repo.insert(changeset) do
      {:ok, _participation} ->
        conn
        |> put_flash(:info, "Participation created successfully.")
        |> redirect(to: participation_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    participation = Repo.get!(Participation, id)
    render(conn, "show.html", participation: participation)
  end

  def edit(conn, %{"id" => id}) do
    participation = Repo.get!(Participation, id) |> Repo.preload([replies: :ticks])
    changeset = Participation.changeset(participation)
    render(conn, "edit.html", participation: participation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "participation" => participation_params}) do
    participation = Repo.get!(Participation, id) |> Repo.preload([replies: :ticks])
    changeset = Participation.changeset(participation, participation_params)

    case Repo.update(changeset) do
      {:ok, participation} ->
        conn
        |> put_flash(:info, "Participation updated successfully.")
        |> redirect(to: participation_path(conn, :show, participation))
      {:error, changeset} ->
        render(conn, "edit.html", participation: participation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    participation = Repo.get!(Participation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(participation)

    conn
    |> put_flash(:info, "Participation deleted successfully.")
    |> redirect(to: participation_path(conn, :index))
  end
end
