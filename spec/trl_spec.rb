RSpec.describe TRL do

  it 'has a version number' do
    expect(TRL::VERSION).not_to be nil
  end

  it 'works' do
    expect(TRL::CLI.start).to be_instance_of(TRL::Command)
  end

end
