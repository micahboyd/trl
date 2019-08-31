RSpec.describe TRL::Command::List do

  subject(:list) { described_class.new(args).execute }

  let(:args) { nil }

  describe 'list with no args', :vcr do
    it { expect(list).to eq(%w[Secret Work]) }
  end

  describe 'with named args' do

    context 'when board name', :vcr do
      let(:args) { 'work' }

      it { expect(list).to eq(%w[New Doing Done]) }
    end

    context 'when board and list name', :vcr do
      let(:args) { 'work/new' }

      it { expect(list).to eq(['Test Card 9', 'Test Card 8', 'Test Card 7']) }
    end

    context 'when board, list and card name', :vcr do
      let(:args) { 'work/new/Test Card 9' }

      it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
    end

  end

  describe 'with indexed args' do

    context 'when board index', :vcr do
      let(:args) { '1' }

      it { expect(list).to eq(%w[New Doing Done]) }
    end

    context 'when board and list index', :vcr do
      let(:args) { '1/0' }

      it { expect(list).to eq(['Test Card 9', 'Test Card 8', 'Test Card 7']) }
    end

    context 'when board, list and card index', :vcr do
      let(:args) { '1/0/0' }

      it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
    end

  end

  describe 'with named and indexed args' do

    context 'when board index and list name', :vcr do
      let(:args) { '1/new' }

      it { expect(list).to eq(['Test Card 9', 'Test Card 8', 'Test Card 7']) }
    end

    context 'when board name, list index, and card name', :vcr do
      let(:args) { 'work/0/test card 9' }

      it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
    end

  end

end
