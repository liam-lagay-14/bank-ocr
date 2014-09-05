require 'rspec'
require_relative '../lib/entry'

describe Entry do

  let(:valid_line_block) { Entry.new([' _                         ',
                                      '  |  |  |  |  |  |  |  |  |',
                                      '  |  |  |  |  |  |  |  |  |'])}

  let(:invalid_line_block) { Entry.new(['        _           _      ',
                                       ' |_||_|      __   __ ||||||',
                                       ' _________|||||||||||||||||'])}

  it('should return the correct data and entries') {
    expect(valid_line_block.raw_lines.size).to eq(3)

    expect(valid_line_block.data.size).to eq(9)
  }

  it 'should return a valid account number' do
    expect(valid_line_block.account.account_number).to eq('711111111')
  end

  context 'should return a number of ? characters' do
    subject { invalid_line_block }

    it { expect(subject.account.account_number).to eq('?????????') }
  end
end
