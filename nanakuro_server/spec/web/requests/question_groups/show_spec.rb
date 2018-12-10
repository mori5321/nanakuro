RSpec.describe 'QuestionGroups#Show API', type: :request do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  context "when question_groups exists" do
    before do
      @question_group = QuestionGroupRepository.new.create(title: 'HelloWorld')
      @question_group_json = QuestionGroupSerializer.new(@question_group).to_json
      get "/question_groups/#{@question_group.id}"
    end

    it "returns 200" do
      expect(last_response.status).to be 200
    end

    it "renders question_group JSON" do
      expect(last_response.body).to eq(@question_group_json)
    end
  end

  context "when question_group does NOT exists" do
    it "returns 404" do
      get "/question_groups/1"
      expect(last_response.status).to be 404
    end
  end
end
