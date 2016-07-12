defmodule Examiner.TestingController do
  use Examiner.Web, :controller

  alias Examiner.Testing

  def index(conn, _params) do
    testings = Repo.all(Testing)
    render(conn, "index.html", testings: testings)
  end

  def new(conn, _params) do
    changeset = Testing.changeset(%Testing{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"testing" => testing_params}) do
    changeset = Testing.changeset(%Testing{}, testing_params)

    case Repo.insert(changeset) do
      {:ok, _testing} ->
        conn
        |> put_flash(:info, "Testing created successfully.")
        |> redirect(to: testing_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    testing = Repo.get!(Testing, id)
    render(conn, "show.html", testing: testing)
  end

  def edit(conn, %{"id" => id}) do
    testing = Repo.get!(Testing, id)
    changeset = Testing.changeset(testing)
    render(conn, "edit.html", testing: testing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "testing" => testing_params}) do
    testing = Repo.get!(Testing, id)
    changeset = Testing.changeset(testing, testing_params)

    case Repo.update(changeset) do
      {:ok, testing} ->
        conn
        |> put_flash(:info, "Testing updated successfully.")
        |> redirect(to: testing_path(conn, :show, testing))
      {:error, changeset} ->
        render(conn, "edit.html", testing: testing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    testing = Repo.get!(Testing, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(testing)

    conn
    |> put_flash(:info, "Testing deleted successfully.")
    |> redirect(to: testing_path(conn, :index))
  end
end
