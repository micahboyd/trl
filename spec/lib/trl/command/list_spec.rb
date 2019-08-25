RSpec.describe TRL::Command::List do

  subject(:list) do
    described_class.new(args).execute
  end

  let(:args) { nil }

  before do
    allow(Trello::Board).to receive(:all) { [build(:board)] }
  end

end
