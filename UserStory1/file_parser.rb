require_relative '../constants'
require_relative 'entry'

class FileParser
  attr_accessor :lines, :entries, :number_of_lines_per_account
  attr_reader :filename

  def initialize(filename, options={})
    @filename = BASEDIR + filename
    @lines = []
    @entries = []
    @number_of_lines_per_account = options.fetch(:number_of_lines_per_account, 3)
  end

  def load_accounts_from_file
    if File.exist?(filename)
      File.open(filename, 'r') do |f|
        f.each_line do |line|
            @lines << line
        end
      end

      load_lines.each do |line_block|
        puts line_block
        entries << Entry.new(line_block)
      end
    else
      raise ArgumentError, "File #{filename} does not exist."
    end
  end


  private

  def load_lines
    line_blocks = []
    entry_array = []

    if lines.count % @number_of_lines_per_account == 0
       lines.each do |line|
           line_blocks << line
           if line_blocks.count % @number_of_lines_per_account == 0
             entry_array << line_blocks
             line_blocks = []
           end
       end
       entry_array
    else
       raise ArgumentError, 'The entries file loaded is in a bad format.'
    end
  end
end