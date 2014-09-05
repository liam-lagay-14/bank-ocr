require 'rspec'
require_relative '../lib/entry_data'


describe EntryData do

  let(:line) { EntryData.new([' _ ', ' _|', '|_ ']) }

  let(:invalid_line) { EntryData.new([' |', '__', '_ '])  }

  it 'returns a value of 2' do
    expect(line.account_digit).to eq('2')
  end

  context 'returns ? if the character is not matched' do
    subject { invalid_line }

    it { expect(invalid_line.account_digit).to eq('?')}
  end
end