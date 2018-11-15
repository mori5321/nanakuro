module Web
  module Controllers
    module Questions
      class Update
        include Web::Action
        expose :question

        params do
          required(:text).filled(:str?)
        end

        def call(params)
          if params.valid?
            @question = QuestionRepository.new.update(params[:id], text: params[:text])
          else
            halt 422, { messages: params.error_messages }.to_json
          end
        end
      end
    end
  end
end
