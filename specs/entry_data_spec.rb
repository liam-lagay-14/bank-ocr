require 'rspec'
require_relative '../lib/entry_data'


describe EntryData do

  let(:line) { EntryData.new([' _ ', ' _|', '|_ ']) }

  let(:invalid_line) { EntryData.new([' _ ',
                                      ' _ ',
                                      ' _|'])  }

  it 'returns a value of 2' do
    expect(line.account_digit).to eq('2')
  end

  it 'should return ? if the character is not matched' do
    expect(invalid_line.account_digit).to eq('?')
  end

  it 'should return a list of digits for a line' do
    expect(invalid_line.substitute_underscore_or_pipe_into_characters).to eq(%w(5 3))
  end
end