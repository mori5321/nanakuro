class QuestionRoomRepository < Hanami::Repository
  associations do
    belongs_to :question_group
  end

  def find_by_unique_id(unique_id)
    question_rooms.where(unique_id: unique_id).first
  end
end
