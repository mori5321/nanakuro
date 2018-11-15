module Web
  module Views
    module Questions
      class Create
        include Web::View
        format :json

        def render
          raw QuestionSerializer.new(question).to_json
        end
      end
    end
  end
end
