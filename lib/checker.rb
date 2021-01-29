require 'colorize'
require 'strscan'
require_relative './linter.rb'

class CheckErrors
  attr_reader :checker, :errors
  def initialize(file_path)
    @checker = FileChecker.new(file_path)
    @errors = []
    @keywords = %w[begin case class def do if module unless]
  end

  def tag_error
    check_tag_error(/\(/, /\)/, '(', ')', 'Paranthesis')
    check_tag_error(/\(/, /\)/, '[', ']', 'Square Brackets')
    check_tag_error(/\(/, /\)/, '{', '}', 'Curly Brackets')
  end

  def trailing_space
    @checker.file_lines.each_with_index do |element, index|
      if element[-2] == ' ' && !element.strip.empty?
        errors << "line #{index + 1}:#{element.size - 1} Space Detected "
        + " '#{element.gsub(/\s*$/, '_')}'"
        end
    end
  end

  def empty_line
    @checker.file_lines.each_with_index do |str_val, index|
      check_class_empty_line(str_val, index)
      check_def_empty_line(str_val, index)
      check_end_empty_line(str_val, index)
      check_do_empty_line(str_val, index)
    end
  end

  def end_error
    keyword_count = 0
    end_count = 0
    @checker.file_lines.each_with_index do |str_val, _index|
      keyword_count += 1 if @keywords.include?(str_val.split(' ').first) || str_val.split(' ').include?('do')
      end_count += 1 if str_val.strip == 'end'
    end

    status = keyword_count <=> end_count
    log_error("Lint/Syntax: Missing 'end'") if status.eql?(1)
    log_error("Lint/Syntax: Unexpected 'end'") if status.eql?(-1)
  end

  # rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

  def check_indentation
    message = 'IndentWidth: Use 2 spaces for indentation.'
    current_value = 0
    indent_value = 0

    @checker.file_lines.each_with_index do |str_val, index|
      strip_line = str_val.strip.split(' ')
      expected_value = current_value * 2
      reset_word = %w[class def if elsif until module unless begin case]

      next if str_val.strip.empty? || strip_line.first.eql?('#')

      indent_value += 1 if reset_word.include?(strip_line.first) || strip_line.include?('do')
      indent_value -= 1 if str_val.strip == 'end'

      next if str_val.strip.empty?

      indent_error(str_val, index, expected_value, message)
      current_value = indent_value
    end
  end

  def indent_error(str_val, index, expected_value, message)
    strip_line = str_val.strip.split(' ')
    emp = str_val.match(/^\s*\s*/)
    end_check = emp[0].size.eql?(expected_value.zero? ? 0 : expected_value - 2)

    if str_val.strip.eql?('end') || strip_line.first == 'elsif' || strip_line.first == 'when'
      log_error("line:#{index + 1} #{message}") unless end_check
    elsif !emp[0].size.eql?(expected_value)
      log_error("line:#{index + 1} #{message}")
    end
  end

  # rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

  def check_class_empty_line(str_val, index)
    message = 'Empty line detected at method body beginning'
    return unless str_val.strip.split(' ').first.eql?('class')

    log_error("line:#{index + 2} #{message}") if @checker.file_lines[index + 1].strip.empty?
  end

  def check_def_empty_line(str_val, index)
    message1 = 'Empty line detected at method body beginning'
    message2 = 'Use empty line between method definition'

    return unless str_val.strip.split(' ').first.eql?('def')

    log_error("line:#{index + 2} #{message1}") if @checker.file_lines[index + 1].strip.empty?
    log_error("line:#{index + 1} #{message2}") if @checker.file_lines[index - 1].strip.split(' ').first.eql?('end')
  end

  def check_tag_error(*argm)
    @checker.file_lines.each_with_index do |str_val, index|
      open_par = []
      clos_par = []
      open_par << str_val.scan(argm[0])
      clos_par << str_val.scan(argm[1])

      status = open_par.flatten.size <=> clos_par.flatten.size

      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{argm[2]}' #{argm[4]}") if status.eql?(1)
      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token  '#{argm[3]}' #{argm[4]}") if status.eql?(-1)
    end
  end

  def check_end_empty_line(str_val, index)
    return unless str_val.strip.split(' ').first.eql?('end')

    log_error("line:#{index} Empty line detected at block body end") if @checker.file_lines[index - 1].strip.empty?
  end

  def check_do_empty_line(str_val, index)
    message = 'Empty line detected at block body beginning'
    return unless str_val.strip.split(' ').include?('do')

    log_error("line:#{index + 2} #{message}") if @checker.file_lines[index + 1].strip.empty?
  end

  def log_error(error_message)
    @errors << error_message
  end
end
