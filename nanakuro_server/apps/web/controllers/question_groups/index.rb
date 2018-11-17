module Web
  module Controllers
    module QuestionGroups
      class Index
        include Web::Action
        expose :question_groups

        def call(params)
          @question_groups = QuestionGroupRepository.new.all_with_questions
        end
      end
    end
  end
end
