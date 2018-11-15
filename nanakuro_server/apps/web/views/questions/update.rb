module Web
  module Views
    module Questions
      class Update
        include Web::View
        format :json

        def render
          raw QuestionSerializer.new(question).to_json
        end
      end
    end
  end
end
