module Web
  module Views
    module Questions
      class Index
        include Web::View
        format :json

        def render
          raw EachSerializer.new(questions, QuestionSerializer).to_json
        end
      end
    end
  end
end
