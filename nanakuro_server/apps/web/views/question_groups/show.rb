module Web
  module Views
    module QuestionGroups
      class Show
        include Web::View

        def render
          raw QuestionGroupSerializer.new(question_group).to_json
        end
      end
    end
  end
end
