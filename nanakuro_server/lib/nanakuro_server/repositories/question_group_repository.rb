class QuestionGroupRepository < Hanami::Repository
  associations do
    has_many :questions
  end

  # メタプロしたい...。
  # self.relations.to_aで取れる雰囲気
  def all_with_questions
    where_with_questions({})
  end

  def where_with_questions(query_hash = {})
    aggregate(:questions).where(query_hash).map_to(QuestionGroup).to_a
  end

  def find_with_questions(id)
    aggregate(:questions).where(id: id).map_to(QuestionGroup).one
  end
end
