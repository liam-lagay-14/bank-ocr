require 'rspec'
require_relative '../UserStory1/account'

describe Account do

  let(:valid_account) { Account.new('711111111') }

  it 'should return a valid account number' do
    expect(valid_account.account_number).to eq('711111111')

    expect(valid_account.account_details).to eq('')
  end

  context 'should fail if an account number does not have a valid checksum' do
    subject { Account.new('0123488823') }

    it { expect(subject.account_details).to eq('ERR')}
  end

  context 'should fail if an account number does not contain 9 digits' do

    subject { Account.new('83478987?') }

    it { expect(subject.account_details).to eq('ILL') }
  end
end