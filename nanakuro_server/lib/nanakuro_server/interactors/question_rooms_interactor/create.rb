require 'hanami/interactor'

module QuestionRoomsInteractor
  class Create
    include Hanami::Interactor

    expose :question_room

    def initialize(repository: QuestionRoomRepository.new)
      @repository = repository
    end


    def call(question_room_params)
      params = params_with_unique_id(question_room_params)
      @question_room = @repository.create(params)
    end

    private
      def params_with_unique_id(params)
        unique_id = UniqueIdGenerator.new(@repository).exec
        params = params.merge(unique_id: unique_id)
      end
  end
end
