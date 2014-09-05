require_relative '../UserStory2/account_checksum'

class Account
  attr_accessor :account_number
  attr_reader :account_checksum

  def initialize(account_number)
    @account_number = account_number
    @account_checksum = AccountCheckSum.new(account_number)

    raise ArgumentError, "account number #{account_number} is invalid." unless is_valid_account_number?
  end

  def is_valid_account_number?
    account_number.to_s =~ /^[0-9]{9}$/ && account_checksum.is_account_valid_checksum?
  end
end