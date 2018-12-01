class QuestionRoomRepository < Hanami::Repository
  def find_by_unique_id(unique_id)
    question_rooms.where(unique_id: unique_id).first
  end
end
