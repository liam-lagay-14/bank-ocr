require 'rspec'
require_relative '../lib/file_parser'

describe FileParser do
  let(:parser) { FileParser.new('/TestFiles/testfile1.txt', number_of_lines_per_account: 3) }

  it 'should parse the correct number of lines' do
    expect { parser.load_accounts_from_file }.to change { parser.lines.size }.from(0).to(33)

    expect(parser.entries.size).to eq(11)
  end

  context 'should fail if a file does not exist' do

    subject { FileParser.new('/TestFiles/gobbledygook.txt', number_of_lines_per_account: 3) }

    it { expect { subject.load_accounts_from_file }.to raise_error(ArgumentError) }
  end
end