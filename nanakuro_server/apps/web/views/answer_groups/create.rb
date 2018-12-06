module Web
  module Views
    module AnswerGroups
      class Create
        include Web::View

        def render
          raw AnswerGroupSerializer.new(answer_group).to_json
        end
      end
    end
  end
end
