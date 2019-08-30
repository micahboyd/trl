RSpec.describe TRL do

  it 'has a version number' do
    expect(TRL::VERSION).not_to be nil
  end

  it 'works' do
    expect(TRL::CLI).to respond_to(:start)
  end

end
