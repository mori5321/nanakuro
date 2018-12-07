require 'hanami/interactor'

module AnswersInteractor
  class Update
    include Hanami::Interactor

    expose :answer

    def initialize(repository: AnswerRepository.new)
      @repository = repository
    end


    def call(id, answer_params)
      @answer = @repository.update(id, answer_params)
    end

  end
end
