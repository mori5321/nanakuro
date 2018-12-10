RSpec.describe UniqueIdGeneratorService, type: :service do
  describe '#exec' do
    context "when QuestionRoomRepository(#find_by_unique_id implemented) is given as an argument" do
      let(:repo) { QuestionRoomRepository.new }
      let(:service) { UniqueIdGeneratorService.new(repo)}

      it "returns string" do
        result = service.exec
        expect(result.class).to eq String
      end
    end

    context "when UserRepository(#find_by_unique_id NOT implemented) is given as an argument" do
      let(:repo) { UserRepository.new }
      let(:service) { UniqueIdGeneratorService.new(repo)}

      it "raises NotImplementedError" do
        expect {
          service.exec
        }.to raise_error(NotImplementedError)
      end
    end
  end
end
