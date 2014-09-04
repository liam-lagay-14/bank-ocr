require 'pathname'
require_relative 'UserStory1/file_parser'

puts 'User Story 1 execution by Liam Lagay'

file = FileParser.new('/TestFiles/testfile1.txt')
entries = file.load_accounts_from_file

entries.each do |entry|
  puts entry.line_account
end

