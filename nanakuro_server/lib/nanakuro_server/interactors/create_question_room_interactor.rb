require 'hanami/interactor'

class CreateQuestionRoomInteractor
  include Hanami::Interactor

  expose :question_room

  def initialize(repository: QuestionRoomRepository.new)
    @repository = repository
  end


  def call(question_room_params)
    @question_room = @repository.create(question_room_params)
  end

end
