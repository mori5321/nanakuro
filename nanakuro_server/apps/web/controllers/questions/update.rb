module Web
  module Controllers
    module Questions
      class Update
        include Web::Action
        expose :question

        def call(params)
          @question = QuestionRepository.new.update(params[:id], text: params[:text])
        end
      end
    end
  end
end
