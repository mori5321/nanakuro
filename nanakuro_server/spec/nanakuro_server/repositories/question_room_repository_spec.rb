RSpec.describe QuestionRoomRepository, type: :repository do
  # place your tests here

  describe '#find_by_unique_id' do
    let(:unique_id) { 'abcdefg' }
    let(:question_room) { QuestionRoomRepository.create(unique_id: unique_id) }

    it "should fetch a record by unique_id" do
      QuestionRoomRepository.new.find_by_unique_id(unique_id)
    end
  end
end
