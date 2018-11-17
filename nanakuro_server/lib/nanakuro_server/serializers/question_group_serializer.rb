

class QuestionGroupSerializer < BaseSerializer
  attribute :id, :title, :created_at, :updated_at, :questions

  def questions
    if object.questions
      EachSerializer.new(object.questions, QuestionSerializer).to_hash
    else
      []
    end
  end
end
