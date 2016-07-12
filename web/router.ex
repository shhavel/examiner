defmodule Examiner.Router do
  use Examiner.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Examiner do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/testings", TestingController
    resources "/questions", QuestionController
    resources "/answers", AnswerController
    resources "/results", ResultController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Examiner do
  #   pipe_through :api
  # end
end
