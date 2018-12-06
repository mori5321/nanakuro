module Web
  module Views
    module Answers
      class Create
        include Web::View

        def render
          raw AnswerSerializer.new(answer).to_json
        end
      end
    end
  end
end
