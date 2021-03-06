RSpec.describe TRL::Command::List do

  subject(:list) { described_class.new(args, options).execute }

  let(:args) { nil }
  let(:options) { {} }

  describe 'list with no args', :vcr do
    it { expect(list).to eq(['[0] Secret', '[1] Work']) }
  end

  describe 'with named args' do

    context 'when board name', :vcr do
      let(:args) { 'work' }

      it { expect(list).to eq(["[0] New", "[1] Doing", "[2] Done"]) }
    end

    context 'when board and list name', :vcr do
      let(:args) { 'work/new' }

      it { expect(list).to eq(['[0] Test Card 9', '[1] Test Card 8', '[2] Test Card 7']) }
    end

    context 'when board, list and card name', :vcr do
      let(:args) { 'work/new/Test Card 9' }

      it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
    end

  end

  describe 'with indexed args' do

    context 'when board index', :vcr do
      let(:args) { '1' }

      it { expect(list).to eq(["[0] New", "[1] Doing", "[2] Done"]) }
    end

    context 'when board and list index', :vcr do
      let(:args) { '1/0' }

      it { expect(list).to eq(['[0] Test Card 9', '[1] Test Card 8', '[2] Test Card 7']) }
    end

    context 'when board, list and card index', :vcr do
      let(:args) { '1/0/0' }

      it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
    end

  end

  describe 'with named and indexed args' do

    context 'when board index and list name', :vcr do
      let(:args) { '1/new' }

      it { expect(list).to eq(['[0] Test Card 9', '[1] Test Card 8', '[2] Test Card 7']) }
    end

    context 'when board name, list index, and card name', :vcr do
      let(:args) { 'work/0/test card 9' }

      it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
    end

  end

  describe 'fetching card attributes' do
    let(:args) { 'work/new/Test Card 9' }

    context 'with description option', :vcr do
      let(:options) { { description: 'something' } }

      it { expect(list).to eq('Test Card 9 description. Card instructions usually here.') }
    end

    context 'with labels option', :vcr do
      let(:options) { { labels: 'something' } }

      it { expect(list).to eq(['[0] Easy']) }
    end

  end

end
