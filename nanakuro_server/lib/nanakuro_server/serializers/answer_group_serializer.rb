require_relative 'base_serializer.rb'

class AnswerGroupSerializer < BaseSerializer
  attribute :id, :name, :created_at, :updated_at, :question_group_id
end
