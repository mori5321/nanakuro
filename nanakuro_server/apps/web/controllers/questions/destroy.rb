module Web
  module Controllers
    module Questions
      class Destroy
        include Web::Action
        expose :question

        def call(params)
          repository = QuestionRepository.new
          if @question = repository.find(params[:id])
            repository.delete(@question.id)
          else
            halt 404, { messages: ["Resource NOT FOUND"] }.to_json
          end
        end
      end
    end
  end
end
