#!/usr/bin/env ruby
require_relative '../lib/checker.rb'

check = CheckErrors.new('./bad.rb')
check.check_identation
check.trailing_space
check.tag_error
check.end_error
check.empty_line_error

if check.errors.empty? && check.check.err_message.empty?
    puts 'No offenses'.colorize(:green) + 'detected'
else
    check.errors.uniq.each do |err|
        puts "#{check.check.file_path.colorize(:blue)} : #{err.colorize(:red)}"
    end
end

puts check.check.err_message if check.check.file_lines.empty?