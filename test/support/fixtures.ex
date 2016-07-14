defmodule Examiner.Fixtures do
  alias Examiner.Repo
  alias Examiner.Test
  alias Examiner.Question
  alias Examiner.Answer
  alias Examiner.Participation
  alias Examiner.Reply
  alias Examiner.Tick

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

  def fixture(:participation) do
    Repo.one(Participation, limit: 1) || Repo.insert!(%Participation{test_id: fixture(:test).id})
  end

  def fixture(:reply) do
    Repo.one(Reply, limit: 1) || Repo.insert!(%Reply{participation_id: fixture(:participation).id, question_id: fixture(:question).id})
  end

  def fixture(:tick) do
    Repo.one(Tick, limit: 1) || Repo.insert!(%Tick{reply_id: fixture(:reply).id, answer_id: fixture(:answer).id})
  end

  def valid_attrs(:question) do
    %{test_id: fixture(:test).id, text: "Найдавнішими архейськими і протерозойськими породами складено:"}
  end

  def valid_attrs(:answer) do
    %{question_id: fixture(:question).id, text: "Причорноморську западину"}
  end

  def valid_attrs(:participation) do
    %{test_id: fixture(:test).id}
  end

  def valid_attrs(:reply) do
    %{participation_id: fixture(:participation).id, question_id: fixture(:question).id}
  end

  def valid_attrs(:tick) do
    %{reply_id: fixture(:reply).id, answer_id: fixture(:answer).id}
  end
end
