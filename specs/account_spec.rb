require 'rspec'
require_relative '../UserStory1/account'

describe Account do

  let(:valid_account) { Account.new('012283488') }

  it 'should return a valid account number' do
    expect(valid_account.is_valid_account_number?).to eq(0)

    expect(valid_account.account_number).to eq("012283488")
  end

  context 'should fail if an account number does not contain 9 digits' do

    subject { Account.new('83478') }

    it { expect { subject }.to raise_error(ArgumentError) }
  end

  context 'should fail if a character contains anything other than numbers' do
    subject { Account.new('1234jk234')  }

    it { expect { subject }.to raise_error(ArgumentError) }
  end

end