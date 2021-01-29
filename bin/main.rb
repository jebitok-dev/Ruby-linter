#!/usr/bin/env ruby
require_relative '../lib/checker'

check = CheckErrors.new('bad.rb')
check.check_indentation
check.trailing_space
check.tag_error
check.end_error
check.empty_line

if check.errors.empty? && check.checker.err_message.empty?
  message = 'No errors'.upcase.colorize(:green)
  puts 'No offenses'.colorize(:green) + 'detected'
else
  check.errors.uniq.each do |err|
    puts "#{check.checker.file_path.colorize(:green)} : #{err.colorize(:red)}"
  end
end

puts check.checker.err_message if check.checker.file_lines.empty?
