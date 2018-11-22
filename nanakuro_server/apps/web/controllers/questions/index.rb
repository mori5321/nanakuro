module Web
  module Controllers
    module Questions
      class Index
        include Web::Action
        expose :questions

        def call(params)
          questionRepo = QuestionRepository.new
          @questions = questionRepo.all_with_question_group
        end
      end
    end
  end
end
