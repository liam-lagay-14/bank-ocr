require_relative 'line'
require_relative 'account'
require 'enumerator'

class Entry
  attr_accessor :raw_lines, :data, :account_number

  def initialize(raw_lines, options={})
    @raw_lines = raw_lines
    @number_of_characters = options.fetch(:number_of_characters, 27)
    @character_width = options.fetch(:character_width, 3)
    @character_height = options.fetch(:character_height, 3)
    @data = process_data

    @account_number = calculate_account_number
  end

  private


  def process_data
    digits = []
    character_digits = []

    (0..@number_of_characters - 1).step(@character_width) do |start_position|
      end_position = start_position + 2
      0.upto(@character_height - 1) do |index_number|
        value = raw_lines[index_number].chars[start_position..end_position].join
        #Strip out newlines (was doing this in my IDE)
        character_digits << value.sub("\n", " ")
      end
      digits << Line.new(character_digits)
      character_digits = []
    end
    digits
  end

  def calculate_account_number
    account_number_to_display = ''

    data.map.with_index  do |digit, index|
       account_number_to_display += digit.account_digit.to_s
    end

    account_number_to_display = Account.new(account_number_to_display)

    account_number_to_display.account_number
  end
end