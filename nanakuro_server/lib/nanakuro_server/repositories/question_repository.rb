class QuestionRepository < Hanami::Repository
  associations do
    belongs_to :question_group
  end

  def all_with_question_group
    where_with_question_group({})
  end

  def where_with_question_group(query_hash={})
    aggregate(:question_group).where(query_hash).map_to(Question).to_a
  end
end
