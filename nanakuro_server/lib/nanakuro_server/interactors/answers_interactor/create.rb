require 'hanami/interactor'

module AnswersInteractor
  class Create
    include Hanami::Interactor

    expose :answer

    def initialize(answer_params, repository: AnswerRepository.new)
      @answer_params = answer_params
      @repository = repository
    end


    def call
      @answer = @repository.create(@answer_params)
    end

    private
      def valid?
        AnswerGroupRepository.new.find(@answer_params[:answer_group_id]) && QuestionRepository.new.find(@answer_params[:question_id]) && @answer_params[:text]
      end
  end
end
