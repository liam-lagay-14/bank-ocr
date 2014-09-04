require 'rspec'
require_relative '../UserStory1/line'


describe Line do

  let(:line) { Line.new('  ||||| |||| ||  |||_|  |_ ') }

  subject { line }

  it { expect(subject.contains_valid_characters?).to eq(0) }


  context 'has invalid characters' do
    subject { Line.new('___ || 1233 ___ |||||||||') }

    it { expect(subject.contains_valid_characters?).to eq(nil) }
  end
end