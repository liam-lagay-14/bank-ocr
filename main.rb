require 'pathname'
require_relative 'UserStory1/file_parser'

puts 'User Story 3 execution by Liam Lagay'

file = FileParser.new('/TestFiles/testfile1.txt', number_of_lines_per_account:3)
entries = file.load_accounts_from_file

entries.each do |entry|
  puts entry.account.account_number + ' ' + entry.account.account_details
end


