module Web
  module Controllers
    module AnswerGroups
      module Answers
        class Update
          include Web::Action

          expose :answer

          params do
            required(:id).filled(:int?)
            required(:text).filled(:str?)
          end

          def call(params)
            halt 400 unless params.valid?
            result = AnswersInteractor::Update.new.call(@params.get(:id), answer_params)
            @answer = result.answer
            self.status = 201 # TODO: correct status?
          end

        private
          def answer_params
            {
              text: @params.get(:text),
            }
          end
        end
      end
    end
  end
end
