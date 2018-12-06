require 'hanami/interactor'

module AnswerGroupsInteractor
  class Create
    include Hanami::Interactor

    expose :answer_group

    def initialize(repository: AnswerGroupRepository.new)
      @repository = repository
    end


    def call(answer_group_params)
      @answer_group = @repository.create(answer_group_params)
    end

  end
end
