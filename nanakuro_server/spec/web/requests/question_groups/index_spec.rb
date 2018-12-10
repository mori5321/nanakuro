require "spec_helper"

RSpec.describe 'QuestionGroups#Index API', type: :request do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  context "when question_groups exists" do
    before do
      @question_groups = 3.times.map { QuestionGroupRepository.new.create(title: 'HelloWorld') }
      @question_groups_serialized = EachSerializer.new(@question_groups, QuestionGroupSerializer).to_json
    end

    it "renders question_groups JSON" do
      get "/question_groups"
      expect(last_response.status).to be 200
      expect(last_response.body).to eq(@question_groups_serialized)
    end
  end

  context "when question_groups does NOT exists" do
    it "renders empty JSON" do
      get "/question_groups"
      expect(last_response.status).to be 200
      expect(last_response.body).to eq([].to_json)
    end
  end
end
