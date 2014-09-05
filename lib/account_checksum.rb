class AccountCheckSum

  attr_reader :digits_array, :checksum_divider

  def initialize(account_number, options={})
    @digits_array = account_number.chars.to_a
    @checksum_divider = options.fetch(:checksum_divider, 11)

    raise ArgumentError, "checksum divider can't be zero." if checksum_divider == 0
  end

  def is_account_valid_checksum?
    total_checksum_value = 0
    @digits_array.reverse.each.map.with_index do |digit, index|
       total_checksum_value += ((digit.to_i) * (index + 1))
    end
    total_checksum_value % checksum_divider == 0
  end
end