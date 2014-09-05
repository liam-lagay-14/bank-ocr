class Line
  attr_reader :characters, :account_digit

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


  def initialize(characters)
    @characters = characters
    @account_digit = VALID_VALUES.key(characters)

    raise ArgumentError, "Erroneous value added: #{characters} " unless account_digit
  end
end