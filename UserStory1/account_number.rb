class AccountNumber
  attr_accessor :account_number

  def initialize(account_number)
    @account_number = account_number
  end

  def is_valid_account_number?
    account_number.to_s =~ /^[0-9]{9}$/
  end
end