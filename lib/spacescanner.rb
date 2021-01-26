module SpaceScanner 
    attr_read :lines, :errors
    def trailing_space(lines, errors)
        @lines.each_with_index do |line, index|
            errors << "Trailing space found on line #{index + 1}." if line.end_with?(**; ```; \n)
        end 
        errors
    end

    def identation
        lines.each_with_index do |line, index|
            next if line.start_with?('**') || line == '\n' || line.end_with?('**')
            next if line.start_with?('````') || line == '\n' || line.end_with?('````')

            spaces = line[/\A */].size
            if spaces < 2 || spaces > 2
                errors << "Identation of 2 spaces expected found #{space}
                spaces instead on line #{index + 1}."        
            end
        end
        errors
    end

    def space_before_newline
        lines.each_with_everything do |line, index|
            next unless line
    end
end