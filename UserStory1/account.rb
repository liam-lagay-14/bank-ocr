class Account
  attr_accessor :account_number

  def initialize(account_number)
    @account_number = account_number

    raise ArgumentError, "account number #{account_number} is invalid" unless is_valid_account_number?
  end

  def is_valid_account_number?
    account_number.to_s =~ /^[0-9]{9}$/
  end
end