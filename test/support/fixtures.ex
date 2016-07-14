defmodule Examiner.Fixtures do
  alias Examiner.Repo
  alias Examiner.Test
  alias Examiner.Question
  alias Examiner.Answer
  alias Examiner.Result

  def fixture(:test) do
    Repo.one(Test, limit: 1) || Repo.insert!(%Test{category: "g8", locale: "uk", name: "ПРИРОДНІ УМОВИ ТА ПРИРОДНІ РЕСУРСИ"})
  end

  def fixture(:question) do
    Repo.one(Question, limit: 1) || Repo.insert!(%Question{test_id: fixture(:test).id,
      text: "Найдавнішими архейськими і протерозойськими породами складено:"})
  end

  def fixture(:answer) do
    Repo.one(Answer, limit: 1) || Repo.insert!(%Answer{question_id: fixture(:question).id,
      text: "Причорноморську западину"})
  end

  def fixture(:result) do
    Repo.one(Result, limit: 1) || Repo.insert!(%Result{test_id: fixture(:test).id})
  end

  def valid_attrs(:question) do
    %{test_id: fixture(:test).id, text: "Найдавнішими архейськими і протерозойськими породами складено:"}
  end

  def valid_attrs(:answer) do
    %{question_id: fixture(:question).id, text: "Причорноморську западину"}
  end

  def valid_attrs(:result) do
    %{test_id: fixture(:test).id}
  end
end
