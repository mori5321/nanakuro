module Web
  module Views
    module Questions
      class Index
        include Web::View

        def render
          raw EachSerializer.new(questions, QuestionSerializer).to_json
        end
      end
    end
  end
end
