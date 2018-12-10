module Web
  module Views
    module AnswerGroups
      module Answers
        class Update
          include Web::View

          def render
            raw AnswerSerializer.new(answer).to_json
          end
        end
      end
    end
  end
end
