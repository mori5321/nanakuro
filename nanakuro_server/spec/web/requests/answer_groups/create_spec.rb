RSpec.describe "AnswerGroups#CreateAPI", type: :request do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  context "with valid question_room_id and name" do
    before do
      @question_group = QuestionGroupRepository.new.create(title: 'HelloWorld')
      @question_room = QuestionRoomRepository.new.create(question_group_id: @question_group.id, unique_id: "aaaaaaaa")
      post "/answer_groups", { question_room_unique_id: @question_room.unique_id, name: "Tom" }
    end

    it "returns 201" do
      expect(last_response.status).to eq 201
    end

    it "returns AnswerGroup associated with QuestionRoom" do
      expect(AnswerGroupRepository.new.last.question_room_unique_id).to eq @question_room.unique_id
    end

  end

  context "with valid question_room_id and name" do
    before do
      post "/answer_groups", { question_room_id: 1111111, name: "Tom" }
    end

    it "returns 400" do
      expect(last_response.status).to eq 400
    end
  end
end
