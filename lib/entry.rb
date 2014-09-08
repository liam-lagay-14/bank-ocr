require_relative 'entry_data'
require_relative 'account'

class Entry
  attr_accessor :raw_lines, :data, :account, :possible_account_numbers

  def initialize(raw_lines, options={})
    @raw_lines = raw_lines
    @number_of_characters = options.fetch(:number_of_characters, 27)
    @character_width = options.fetch(:character_width, 3)
    @character_height = options.fetch(:character_height, 3)
    @data = process_data
    @possible_account_numbers = []
    @account = obtain_account_details
  end

  private


  def process_data
    digits = []
    character_digits = []

    (0..@number_of_characters - 1).step(@character_width) do |start_position|
      end_position = start_position + 2
      0.upto(@character_height - 1) do |index_number|
        value = raw_lines[index_number].chars[start_position..end_position].join
        #Strip out newlines (was doing this in my IDE).
        character_digits << value.sub("\n", '')
      end
      digits << EntryData.new(character_digits)
      character_digits = []
    end
    digits
  end

  def obtain_account_details

    account = create_new_account

    if !account.account_details.empty?
      @possible_account_numbers = get_possible_alternative_accounts
    end
    account
  end

  def get_possible_alternative_accounts
    alternative_accounts = []
    data.each do |digit|
        digit_list = digit.substitute_underscore_or_pipe_into_characters
        if digit_list.size > 0
          digit_list.each do |possible_digit|
            digit.account_digit = possible_digit
            alternative_account = create_new_account
            if alternative_account.account_details.empty?
              alternative_accounts << alternative_account.account_number
            end
          end
        end
      end
    alternative_accounts.uniq
  end

  def create_new_account
    account_number_to_display = ''

    data.each  do |digit|
      account_number_to_display += digit.account_digit
    end

    Account.new(account_number_to_display)
  end
end