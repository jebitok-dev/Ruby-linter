require_relative '../lib/linter.rb'
class Buffer 
    def self.check(file)
        errors = []
        lines = File.open(file).to_a

        if lines.size.positive?
            check = Linter.new
            check.last_line(lines, errors)
            check.indentation(lines, errors)
            check.trailing_space(lines, errors)
            check.space_before_bracket(lines, errors)
        end
        errors
    end
end