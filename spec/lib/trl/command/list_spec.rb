RSpec.describe TRL::Command::List do

  subject(:list) { described_class.new(args).execute }

  let(:args) { nil }

  describe 'list with no args', :vcr do
    it { expect(list).to eq(%w[Secret Work]) }
  end

  describe 'list with board name', :vcr do
    let(:args) { 'work' }

    it { expect(list).to eq(%w[New Doing Done]) }
  end

  describe 'list with board and list name', :vcr do
    let(:args) { 'work/new' }

    it { expect(list).to eq(['Test Card 9', 'Test Card 8', 'Test Card 7']) }
  end

  describe 'list with board, list and card name', :vcr do
    let(:args) { 'work/new/Test Card 9' }

    it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
  end

end
