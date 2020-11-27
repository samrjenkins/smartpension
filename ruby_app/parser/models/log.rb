# frozen_string_literal: true

module Parser
  class Log
    def initialize(file_path)
      @file_path = file_path
    end

    def each_line(&block)
      within_open_file do |file_lines|
        file_lines.each(&block)
      end
    end

    private

    attr_reader :file_path

    def within_open_file(&block)
      File.open(file_path.to_s, &block)
    end
  end
end
