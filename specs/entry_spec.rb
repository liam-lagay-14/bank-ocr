require 'rspec'
require_relative '../UserStory1/entry'

describe Entry do

  let(:valid_line_block) { Entry.new([' _  _  _  _  _  _  _     _ ',
                                      '|_   ||_||_|| | _| _||_||_ ',
                                      '|_|  ||_| _||_||_  _|  | _|'])}

  let(:invalid_line_block) { Entry.new(%w(nonsense1 234453453 ----))}

  it 'should return the correct data and entries' do
    expect(valid_line_block.raw_lines.size).to eq(3)

    expect(valid_line_block.data.size).to eq(9)
  end

  it 'should return a valid account number' do
    expect(valid_line_block.account_number).to eq('678902345')
  end

  context 'should raise an error if an invalid entry is passed in' do
    subject { invalid_line_block }

    it { expect { subject }.to raise_error(ArgumentError) }
  end

end
