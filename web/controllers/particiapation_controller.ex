defmodule Examiner.ParticiapationController do
  use Examiner.Web, :controller

  alias Examiner.Test
  alias Examiner.Particiapation

  def index(conn, _params) do
    particiapations = Repo.all(Particiapation)
    render(conn, "index.html", particiapations: particiapations)
  end

  def new(conn, %{"test_id" => test_id}) do
    testing = Repo.get!(Test, test_id) |> Repo.preload([questions: :answers])
    changeset = Particiapation.changeset(%Particiapation{}, %{test_id: test_id})
    render(conn, "new.html", changeset: changeset, testing: testing)
  end

  def create(conn, %{"particiapation" => particiapation_params}) do
    changeset = Particiapation.changeset(%Particiapation{}, particiapation_params)

    case Repo.insert(changeset) do
      {:ok, _particiapation} ->
        conn
        |> put_flash(:info, "Particiapation created successfully.")
        |> redirect(to: particiapation_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    particiapation = Repo.get!(Particiapation, id)
    render(conn, "show.html", particiapation: particiapation)
  end

  def edit(conn, %{"id" => id}) do
    particiapation = Repo.get!(Particiapation, id)
    changeset = Particiapation.changeset(particiapation)
    render(conn, "edit.html", particiapation: particiapation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "particiapation" => particiapation_params}) do
    particiapation = Repo.get!(Particiapation, id)
    changeset = Particiapation.changeset(particiapation, particiapation_params)

    case Repo.update(changeset) do
      {:ok, particiapation} ->
        conn
        |> put_flash(:info, "Particiapation updated successfully.")
        |> redirect(to: particiapation_path(conn, :show, particiapation))
      {:error, changeset} ->
        render(conn, "edit.html", particiapation: particiapation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    particiapation = Repo.get!(Particiapation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(particiapation)

    conn
    |> put_flash(:info, "Particiapation deleted successfully.")
    |> redirect(to: particiapation_path(conn, :index))
  end
end
