module Web
  module Controllers
    module AnswerGroups
      class Create
        include Web::Action
        expose :answer_group

        params do
          required(:question_room_unique_id).filled(:str?)
          # required(:name).filled(:str?)
        end

        def call(params)
          halt 400 unless params.valid?
          result = AnswerGroupsInteractor::Create.new(answer_group_params).call
          if result.successful?
            @answer_group = result.answer_group
            self.status = 201
          else
            halt 400
          end
        end

        private
          def answer_group_params
            {
              question_room_unique_id: @params.get(:question_room_unique_id),
              name: @params.get(:name)
            }
          end
      end
    end
  end
end
