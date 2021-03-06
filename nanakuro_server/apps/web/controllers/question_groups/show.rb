module Web
  module Controllers
    module QuestionGroups
      class Show
        include Web::Action
        expose :question_group

        params do
          required(:id).filled(:int?)
        end

        def call(params)
          @question_group = QuestionGroupRepository.new.find_with_questions(params[:id])
          halt 404 unless @question_group
        end
      end
    end
  end
end
