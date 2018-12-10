RSpec.describe "AnswerGroups::Answers#UpdateAPI", type: :request do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  context "with valid question_room_id and name" do
    before do
      @question_group = QuestionGroupRepository.new.create(title: 'HelloWorld')
      @question = QuestionRepository.new.create(text: "Animal?", question_group_id: @question_group.id)
      @question_room = QuestionRoomRepository.new.create(
        question_group_id: @question_group.id)
      @answer_group = AnswerGroupRepository.new.create(question_room_id: @question_room.id, name: "Tom")
      @answer = AnswerRepository.new.create(answer_group_id: @answer_group.id, text: "Cats", question_id: @question.id)
      patch "/answer_groups/#{@answer_group.id}/answers/#{@answer.id}",
            { text: "Cats" }
    end

    it "returns 201" do
      expect(last_response.status).to eq 201
    end
  end

  # context "with valid question_room_id and name" do
  #   before do
  #     post "/answer_groups/1/answers",
  #           { text: "Cats", question_id: 1  }
  #   end

  #   it "returns 400" do
  #     expect(last_response.status).to eq 400
  #   end
  # end
end
