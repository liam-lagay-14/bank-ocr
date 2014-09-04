require 'rspec'
require_relative '../UserStory1/account_number'

describe AccountNumber do
  describe 'has valid account number' do
    subject { AccountNumber.new('012283488') }

    it { expect(subject.is_valid_account_number?).to eq(0) }
  end
  describe 'has invalid account number' do
    subject { AccountNumber.new('83478') }

    it { expect(subject.is_valid_account_number?).to eq(nil) }
  end
  describe 'should not allow non-numeric characters' do
    subject { AccountNumber.new('1234jk234') }

    it { expect(subject.is_valid_account_number?).to eq(nil) }
  end
end