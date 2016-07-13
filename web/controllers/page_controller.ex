defmodule Examiner.PageController do
  use Examiner.Web, :controller

  alias Examiner.Testing

  def index(conn, _params) do
    testings = Repo.all(Testing)
    render(conn, "index.html", testings: testings)
  end
end
