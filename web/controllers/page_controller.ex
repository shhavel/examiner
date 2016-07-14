defmodule Examiner.PageController do
  use Examiner.Web, :controller

  alias Examiner.Test

  def index(conn, _params) do
    tests = Repo.all(Test)
    render(conn, "index.html", tests: tests)
  end
end
