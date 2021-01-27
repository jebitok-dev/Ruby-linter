require 'colorize'

class FileChecker
    attr_reader :err_message, :file_lines, :file_path, :file_line_number:
    def initialize(file_path)
        @err_message = ''
        @file_path = file_path
        begin
            @file_lines = File.readlines(@file_path)
            @file_line_number = @file_lines.size
        rescue StandardError => e
            @file_lines = []
            @err_message = "Check file name or path again\n".colorize(:red) + e.to_s.colorize(:red)
        end
    end
end