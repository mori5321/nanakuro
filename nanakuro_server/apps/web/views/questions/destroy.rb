module Web
  module Views
    module Questions
      class Destroy
        include Web::View
        format :json

        def render
          raw({ id: question.id, messages: ['Resource DELETED'] }.to_json)
        end
      end
    end
  end
end
