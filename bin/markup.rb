puts '-------------------------------'
puts '   |Welcome to MarkUp Linter!|  '
puts '-------------------------------'


puts ' '
puts 'Scanning file'
puts ' '
file = ARGV[0]
puts ' '
puts 'Always input the correct path for your file i.e ./bin/main.rb lib/good.md'
puts ' '

errors = Linters.check(file)

if errors.size.positive?
    puts "Success 1 file tested. Scan completed with the following #{errors.size} errors: "
    errors.each { |error| puts ' Error: ' + "#{error}\n"}
else
    puts '1 file tested. All checks completed with no errors'
end