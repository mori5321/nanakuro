require_relative 'base_serializer.rb'

class AnswerSerializer < BaseSerializer
  attribute :id, :text, :created_at, :updated_at, :answer_group_id, :question_id
end
