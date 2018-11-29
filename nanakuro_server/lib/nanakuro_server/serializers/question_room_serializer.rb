class QuestionRoomSerializer < BaseSerializer
  attribute :id, :unique_id, :question_group_id
end
