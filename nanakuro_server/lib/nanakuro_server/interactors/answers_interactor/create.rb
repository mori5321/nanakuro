require 'hanami/interactor'

module AnswersInteractor
  class Create
    include Hanami::Interactor

    expose :answer

    def initialize(repository: AnswerRepository.new)
      @repository = repository
    end


    def call(answer_params)
      @answer = @repository.create(answer_params)
    end

  end
end
