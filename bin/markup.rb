#!/usr/bin/env ruby
require_relative '../lib/linter'
require_relative '../lib/buffer'

puts '-------------------------------'
puts '   |Welcome to MarkUp Linter!|  '
puts '-------------------------------'

puts ' '
puts 'Scanning file...'
puts ' '
file = ARGV.first
puts ' '
puts 'Scanning file for possible errors...'
puts ' '
puts 'Always input the correct path for your file i.e ./bin/markup.rb lib/good.md'
puts ' '

errors = Linter.check(file)

if errors.size.positive?
  puts "Success 1 file tested. Scan completed with the following #{errors.size} errors: "
  errors.each { |error| puts ' Error: ' + "#{error}\n" }
else
  puts '1 file tested. All checks completed with no errors'
end
