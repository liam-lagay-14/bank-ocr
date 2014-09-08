require 'pathname'
require_relative 'lib/file_parser'

puts 'User Story 4 execution by Liam Lagay'
puts Time.now

file = FileParser.new('/TestFiles/testdata.txt', number_of_lines_per_account:3)
entries = file.load_accounts_from_file

entries.each do |entry|
  puts entry.account.account_number
  puts 'POSSIBLE ACCOUNT NUMBERS ' + entry.possible_account_numbers.inspect unless entry.possible_account_numbers.size < 1
  puts '>>>>>>>>>'
end


