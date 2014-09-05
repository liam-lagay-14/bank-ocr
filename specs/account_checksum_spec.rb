require 'rspec'
require_relative '../UserStory2/account_checksum'

describe AccountCheckSum do
  let(:valid_account_number) { AccountCheckSum.new('711111111')}

  let(:invalid_account_number) { AccountCheckSum.new('888888888')}

  it 'should verify a valid checksum' do
    expect(valid_account_number.is_account_valid_checksum?).to eq(true)
  end

  it 'should return false if a valid checksum is not calculated' do
    expect(invalid_account_number.is_account_valid_checksum?).to eq(false)
  end

  context 'should raise an error if the checksum divider is passed in as 0' do
    subject { AccountCheckSum.new('711111111', checksum_divider: 0)}

    it { expect { subject }.to raise_error(ArgumentError) }
  end

end