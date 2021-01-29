#!/usr/bin/env ruby
require_relative '../lib/linter'
require_relative '../lib/buffer'

puts '-------------------------------'
puts '   |Welcome to CSS Linter!|  '
puts '-------------------------------'

puts ' '
puts 'Scanning file...'
puts ' '
file = ARGV[0]
puts ' '
puts 'Scanning file for possible errors...'
puts ' '
puts 'Always input the correct path for your file i.e ./bin/markup.rb lib/good.css'
puts ' '

errors = Linter.check(file)

# rubocop:disable Style/StringConcatenation

if errors.size.positive?
  puts "Success 1 file tested. Scan completed with the following #{errors.size} errors: "
  errors.each { |error| puts '  Error: ' + "#{error}\n" }
# rubocop:enable Style/StringConcatenation

else
  puts '1 file tested. All checks completed with no errors'
end
