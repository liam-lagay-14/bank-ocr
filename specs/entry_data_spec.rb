require 'rspec'
require_relative '../UserStory1/entry_data'


describe EntryData do

  let(:line) { EntryData.new([' _ ', ' _|', '|_ ']) }

  it 'returns a value of 2' do
    expect(line.account_digit).to eq(2)
  end

  it 'throws an error if invalid value is passed' do
    expect { EntryData.new([' |', '__', '_ ']) }.to raise_error(ArgumentError)
  end


end