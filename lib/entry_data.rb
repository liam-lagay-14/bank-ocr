class EntryData
  attr_reader :characters, :character_replacements
  attr_accessor :account_digit

 VALID_VALUES = { 0 => [' _ ', '| |', '|_|'],
                  1 => ['   ', '  |', '  |'],
                  2 => [' _ ', ' _|', '|_ '],
                  3 => [' _ ', ' _|', ' _|'],
                  4 => ['   ', '|_|', '  |'],
                  5 => [' _ ', '|_ ', ' _|'],
                  6 => [' _ ', '|_ ', '|_|'],
                  7 => [' _ ', '  |', '  |'],
                  8 => [' _ ', '|_|', '|_|'],
                  9 => [' _ ', '|_|', ' _|']}


  def initialize(characters, options = {})
    @characters = characters
    @character_replacements = ['|', '_', ' ']
    @character_height = options.fetch(:character_height, 3)
    @account_digit = calculate_account_digit_from_characters
  end

  def substitute_underscore_or_pipe_into_characters
    list_of_digits = []

    characters.each do |character|
       (0...@character_height).each do |index_number|
         original_character = character[index_number]
         calculate_possible_list_of_digits(character, index_number, list_of_digits)
         character[index_number] = original_character if original_character != nil
       end
    end
    list_of_digits
  end

  def calculate_possible_list_of_digits(character, index_number, list_of_digits)
    character_replacements.each do |replacement|
      character[index_number] = replacement
      digit = calculate_account_digit_from_characters
      list_of_digits << digit if digit != '?'
    end
  end

  private

  def calculate_account_digit_from_characters
    (VALID_VALUES.key(characters) || '?').to_s
  end
end