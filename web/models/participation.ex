defmodule Examiner.Participation do
  use Examiner.Web, :model

  schema "participations" do
    belongs_to :test, Examiner.Test
    has_many :replies, Examiner.Reply, on_delete: :delete_all
    field :evaluation, :float
    field :mark, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:test_id])
    |> cast_assoc(:replies)
    |> foreign_key_constraint(:test_id)
    |> validate_required([:test_id])
  end

  def changeset_for_test(test) do
    Examiner.Participation.changeset(%Examiner.Participation{test_id: test.id, test: test, replies: replies_for_test(test)})
  end

  def replies_for_test(test) do
    Enum.map(test.questions, fn q -> %Examiner.Reply{question_id: q.id, question: q, opinions: opinions_for_question(q)} end)
  end

  def opinions_for_question(question) do
    Enum.map(question.answers, fn a -> %Examiner.Opinion{answer_id: a.id, answer: a} end)
  end

  def questions_count(participation) do
    List.first(Examiner.Repo.all(Ecto.Query.from(q in Examiner.Question, select: %{count: count(q.id)}, where: q.test_id == ^participation.test_id))).count
  end

  def replies_count(participation) do
    List.first(Examiner.Repo.all(Ecto.Query.from(r in Examiner.Reply, select: %{count: count(r.id)}, where: r.participation_id == ^participation.id))).count
  end

  def finished?(participation) do
    questions_count(participation) == replies_count(participation)
  end

  def correct_replies_count(participation) do
    Enum.count(participation.replies, &(Examiner.Reply.correct?(&1)))
  end

  def evaluation(participation) do
    if questions_count(participation) > 0 do
      correct_replies_count(participation) / questions_count(participation)
    end
  end

  def score(participation) do
    if questions_count(participation) > 0 do
      "#{Float.round(evaluation(participation), 2) * 100}%"
    else
      "undefined"
    end
  end
end
