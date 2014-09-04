require_relative 'line'
require 'enumerator'

class Entry
  attr_accessor :raw_lines, :data

  def initialize(raw_lines, options={})
    @raw_lines = raw_lines
    @number_of_characters = options.fetch(:number_of_characters, 27)
    @character_width = options.fetch(:character_width, 3)
    @character_height = options.fetch(:character_height, 3)
    @data = process_data
  end

  def process

  end

  private


  def process_data
    digits = []
    character_digits = []

    (0..@number_of_characters - 1).step(@character_width) do |start_position|
      end_position = start_position + 2
      0.upto(@character_height - 1) do |index_number|
        value = raw_lines[index_number].chars[start_position..end_position].join
        character_digits << value.sub("\n", " ")
      end
      digits << Line.new(character_digits)
      character_digits = []
    end
    digits
  end
end