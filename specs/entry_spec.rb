require 'rspec'
require_relative '../lib/entry'

describe Entry do

  let(:valid_line_block) { Entry.new([' _                         ',
                                      '  |  |  |  |  |  |  |  |  |',
                                      '  |  |  |  |  |  |  |  |  |'])}

  let(:line_block_missing_characters) { Entry.new([' _  _  _  _  _  _  _  _  _ ',
                                                   ' _| _| _| _| _| _  _| _| _|',
                                                   ' _| _| _| _| _| _| _| _| _|'])}

  let(:invalid_line_block) { Entry.new([' _  _  _  _  _  _  _  _  _ ',
                                        '|_||_||_||_||_||_||_||_||_|',
                                        '|_||_||_||_||_||_||_||_||_|'])}

  it('should return the correct data and entries') {
    expect(valid_line_block.raw_lines.size).to eq(3)

    expect(valid_line_block.data.size).to eq(9)
  }

  it 'should return a valid account number' do
    expect(valid_line_block.account.account_number).to eq('711111111')
  end

  it 'should return a number of ? characters' do
    expect(line_block_missing_characters.account.account_number).to eq('33333?333')

    expect(line_block_missing_characters.account.account_details).to eq('ILL')
  end

  it 'should return a list of possible alternatives for an invalid line passed in (checksum error)' do
    expect(invalid_line_block.account.account_details).to eq('ERR')

    expect(invalid_line_block.possible_account_numbers.size).to eq(3)
  end
end
