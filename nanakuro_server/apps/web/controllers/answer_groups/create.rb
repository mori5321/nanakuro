module Web
  module Controllers
    module AnswerGroups
      class Create
        include Web::Action
        expose :answer_group

        params do
          required(:question_room_id).filled(:int?)
          required(:name).filled(:str?)
        end

        def call(params)
          halt 400 unless params.valid?
          result = AnswerGroupsInteractor::Create.new.call(answer_group_params)
          @answer_group = result.answer_group
          self.status = 201
        end

        private
          def answer_group_params
            {
              question_room_id: @params.get(:question_room_id),
              name: @params.get(:name)
            }
          end
      end
    end
  end
end
