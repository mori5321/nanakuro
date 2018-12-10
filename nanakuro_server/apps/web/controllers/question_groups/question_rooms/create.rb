module Web
  module Controllers
    module QuestionGroups
      module QuestionRooms
        class Create
          include Web::Action
          expose :question_room

          params do
            required(:question_group_id).filled(:int?)
          end

          def call(params)
            halt 400 unless params.valid?
            # repo = QuestionRoomRepository.new
            # @room = repo.create(question_room_params)
            result = QuestionRoomsInteractor::Create.new(question_room_params).call
            if result.successful?
              self.status = 201
              @question_room = result.question_room
            else
              halt 400
            end
          end

          private
            def question_room_params
              {
                question_group_id: @params.get(:question_group_id)
              }
            end
        end
      end
    end
  end
end
