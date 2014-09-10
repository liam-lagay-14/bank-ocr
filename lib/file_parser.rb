require_relative '../constants'
require_relative 'entry'

class FileParser
  attr_accessor :number_of_lines_per_account
  attr_reader :filename

  def initialize(filename, options={})
    @filename = BASEDIR + filename
    @lines = []
    @number_of_lines_per_account = options.fetch(:number_of_lines_per_account, 3)
  end

  def load_accounts_from_file
    raise ArgumentError, "File #{filename} does not exist." unless File.exist?(filename)

    entries = []

    File.open(filename, 'r') do |f|
       f.each_line do |line|
           @lines << line
       end
    end

    load_lines.each do |line_block|
      entries << Entry.new(line_block)
    end

    entries
  end


  private

  def load_lines
     raise ArgumentError, 'The entries file loaded is in a bad format.' unless @lines.count % @number_of_lines_per_account == 0

     line_blocks = []
     entry_array = []

     @lines.each do |line|
         line_blocks << line
         if line_blocks.count % @number_of_lines_per_account == 0
           entry_array << line_blocks
           line_blocks = []
         end
     end
     entry_array
  end
end