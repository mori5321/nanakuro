module Web
  module Controllers
    module Questions
      class Index
        include Web::Action
        expose :questions

        def call(params)
          questionRepo = QuestionRepository.new
          @questions = questionRepo.all
        end
      end
    end
  end
end
