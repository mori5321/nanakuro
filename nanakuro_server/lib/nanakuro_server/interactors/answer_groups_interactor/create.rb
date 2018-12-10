require 'hanami/interactor'

module AnswerGroupsInteractor
  class Create
    include Hanami::Interactor

    expose :answer_group

    def initialize(answer_group_params, repository: AnswerGroupRepository.new)
      @answer_group_params = answer_group_params
      @repository = repository
    end


    def call
      @answer_group = @repository.create(@answer_group_params)
    end

    private
      def valid?
        QuestionRoomRepository.new.find_by_unique_id(@answer_group_params[:question_room_unique_id])
      end

  end
end
