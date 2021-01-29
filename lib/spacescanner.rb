module SpaceScanner
  def trailing_space(lines, errors)
    lines.each_with_index do |line, index|
      errors << "Trailing space found on line #{index + 1}." if line.end_with?("; \n")
    end
    errors
  end

  # rubocop:disable Metrics/PerceivedComplexity
  def indentation(lines, errors)
    lines.each_with_index do |line, index|
      next if line.start_with?('@') || line == '\n' || line.end_with?('\n')
      next if ['{', '}'].any? { |bracket| line.include? bracket }

      spaces = line[/\A */].size
      if spaces < 2 || spaces > 2
        errors << "Indentation of 2 spaces expected
                Found #{spaces} spaces instead on line #{index + 1}."
      end
    end
    errors
  end

  def space_before_bracket(lines, errors)
    lines.each_with_index do |line, index|
      next unless line.include?('{')

      errors << "There should be a space before curly bracket on line #{index + 1}" unless line =~ /[[:space:]]\{/
    end
    errors
  end

  def last_line(lines, errors)
    errors << 'Last line in the file should be empty' unless lines.last.include?("\n")
  end
  # rubocop:enable Metrics/PerceivedComplexity
end
