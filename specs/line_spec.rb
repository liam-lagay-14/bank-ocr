require 'rspec'
require_relative '../UserStory1/line'


describe Line do

  let(:line) { Line.new([' _ ', ' _|', '|_ ']) }

  it 'returns a value of 2' do
    expect(line.account_digit).to eq(2)
  end

  it 'throws an error if invalid value is passed' do
    expect { Line.new([' |', '__', '_ ']) }.to raise_error(ArgumentError)
  end


end