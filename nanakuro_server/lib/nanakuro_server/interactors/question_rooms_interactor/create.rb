require 'hanami/interactor'

module QuestionRoomsInteractor
  class Create
    include Hanami::Interactor

    expose :question_room

    def initialize(question_room_params, repository: QuestionRoomRepository.new)
      @question_room_params = question_room_params
      @repository = repository
    end



    def call
      @question_room = @repository.create(params_with_unique_id)
    end

    private
      def params_with_unique_id
        unique_id = UniqueIdGeneratorService.new(@repository).exec
        @question_room_params.merge(unique_id: unique_id)
      end

      def valid?
        QuestionGroupRepository.new.find(@question_room_params[:question_group_id])
      end
  end
end
