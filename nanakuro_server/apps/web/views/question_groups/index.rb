module Web
  module Views
    module QuestionGroups
      class Index
        include Web::View

        def render
          raw EachSerializer.new(question_groups, QuestionGroupSerializer).to_json
        end
      end
    end
  end
end
