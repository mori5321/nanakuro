module Web
  module Controllers
    module AnswerGroups
      module Answers
        class Create
          include Web::Action
          expose :answer

          params do
            required(:text).filled(:str?)
            required(:answer_group_id).filled(:int?)
            required(:question_id).filled(:int?)
          end

          def call(params)
            halt 400 unless params.valid?
            result = AnswersInteractor::Create.new.call(answer_params)
            @answer = result.answer
            self.status = 201
          end

          private
            def answer_params
              {
                text: @params.get(:text),
                answer_group_id: @params.get(:answer_group_id),
                question_id: @params.get(:question_id)
              }
            end
        end
      end
    end
  end
end
