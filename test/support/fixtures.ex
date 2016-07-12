defmodule Examiner.Fixtures do
  alias Examiner.Repo
  alias Examiner.Testing
  alias Examiner.Question
  alias Examiner.Answer
  alias Examiner.Result

  def fixture(:testing) do
    Repo.one(Testing, limit: 1) || Repo.insert!(%Testing{grade: "g8", locale: "uk", name: "ПРИРОДНІ УМОВИ ТА ПРИРОДНІ РЕСУРСИ"})
  end

  def fixture(:question) do
    Repo.one(Question, limit: 1) || Repo.insert!(%Question{testing_id: fixture(:testing).id,
      text: "Найдавнішими архейськими і протерозойськими породами складено:"})
  end

  def fixture(:answer) do
    Repo.one(Answer, limit: 1) || Repo.insert!(%Answer{question_id: fixture(:question).id,
      text: "Причорноморську западину"})
  end

  def fixture(:result) do
    Repo.one(Result, limit: 1) || Repo.insert!(%Result{testing_id: fixture(:testing).id})
  end

  def valid_attrs(:question) do
    %{testing_id: fixture(:testing).id, text: "Найдавнішими архейськими і протерозойськими породами складено:"}
  end

  def valid_attrs(:answer) do
    %{question_id: fixture(:question).id, text: "Причорноморську западину"}
  end

  def valid_attrs(:result) do
    %{testing_id: fixture(:testing).id}
  end
end
