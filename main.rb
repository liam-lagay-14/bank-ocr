require 'pathname'
require_relative 'UserStory1/file_parser'

puts 'User Story 1 execution by Liam Lagay'

file = FileParser.new('/TestFiles/testfile1.txt', number_of_lines_per_account:3)
file.load_accounts_from_file


