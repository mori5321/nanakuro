module Web
  module Views
    module QuestionGroups
      module QuestionRooms
        class Create
          include Web::View

          def render
            raw QuestionRoomSerializer.new(question_room).to_json
          end
        end
      end
    end
  end
end
