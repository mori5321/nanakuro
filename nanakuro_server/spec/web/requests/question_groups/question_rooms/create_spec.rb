RSpec.describe "QuestionGroups::QuestionRoom#CreateAPI", type: :request do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  context "valid question_room_id is given" do
    before do
      @question_group = QuestionGroupRepository.new.create(title: 'HelloWorld')
      post "question_groups/#{@question_group.id}/question_rooms"
    end

    it "returns 201 created" do
      expect(last_response.status).to eq 201
    end

    it "creates QuestionRoom associated with QuestionGroup" do
      expect(QuestionRoomRepository.new.last.question_group_id).to eq @question_group.id
    end
  end

  context "invalid question_room_id is given" do
    before do
      post "question_groups/1/question_rooms"
    end

    it "returns 400 bad request" do
      expect(last_response.status).to eq 400
    end
  end
end
