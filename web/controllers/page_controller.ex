defmodule Examiner.PageController do
  use Examiner.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
