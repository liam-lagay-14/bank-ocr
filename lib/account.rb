require_relative 'account_checksum'

class Account
  attr_accessor :account_number, :account_details
  attr_reader :account_checksum

  def initialize(account_number)
    @account_number = account_number
    @account_checksum = AccountCheckSum.new(account_number)

    @account_details = set_account_details
  end

  private

  def is_valid_account_number?
    (account_number =~ /^[0-9]{9}$/) == 0
  end

  def set_account_details
    if account_number.include? '?' || !is_valid_account_number?
                    'ILL'
                  elsif !account_checksum.is_account_valid_checksum?
                    'ERR'
                  else ''
    end
  end
end