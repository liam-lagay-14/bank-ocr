require 'rspec'
require_relative '../lib/file_parser'

describe FileParser do
  let(:parser) { FileParser.new('/TestFiles/testdata.txt', number_of_lines_per_account: 3) }

  it 'should parse the correct number of lines' do
    entries = parser.load_accounts_from_file

    expect(entries.size).to eq(11)
  end

  context 'should fail if a file does not exist' do

    subject { FileParser.new('/TestFiles/gobbledygook.txt', number_of_lines_per_account: 3) }

    it { expect { subject.load_accounts_from_file }.to raise_error(ArgumentError) }
  end
end