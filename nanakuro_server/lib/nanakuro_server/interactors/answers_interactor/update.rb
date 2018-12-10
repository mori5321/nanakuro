require 'hanami/interactor'

module AnswersInteractor
  class Update
    include Hanami::Interactor

    expose :answer

    def initialize(id, answer_params, repository: AnswerRepository.new)
      @id = id
      @answer_params = answer_params
      @repository = repository
    end


    def call
      @answer = @repository.update(@id, @answer_params)
    end

  end
end
