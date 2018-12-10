require_relative 'base_serializer.rb'

class QuestionSerializer < BaseSerializer
  attribute :id, :text, :created_at, :updated_at, :question_group_id, :question_group

  def question_group
    if object.question_group
      QuestionGroupSerializer.new(object.question_group).to_hash
    else
      []
    end
  end
end
